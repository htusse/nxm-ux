<?php
// Set headers for CORS and JSON
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json; charset=UTF-8');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Include database configuration
require_once '../config/database.php';

// Function to send JSON response
function sendResponse($success, $message, $data = null, $statusCode = 200) {
    http_response_code($statusCode);
    echo json_encode([
        'success' => $success,
        'message' => $message,
        'data' => $data
    ]);
    exit();
}

// Function to validate input
function validateInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    return $data;
}

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendResponse(false, 'Method not allowed', null, 405);
}

try {
    // Get POST data
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    // Validate required fields
    $requiredFields = ['fullName', 'email', 'phone', 'subject', 'message'];
    $errors = [];

    foreach ($requiredFields as $field) {
        if (!isset($data[$field]) || empty(trim($data[$field]))) {
            $errors[] = ucfirst($field) . ' is required';
        }
    }

    if (!empty($errors)) {
        sendResponse(false, implode(', ', $errors), null, 400);
    }

    // Sanitize inputs
    $fullName = validateInput($data['fullName']);
    $email = validateInput($data['email']);
    $phone = validateInput($data['phone']);
    $subject = validateInput($data['subject']);
    $message = validateInput($data['message']);

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        sendResponse(false, 'Invalid email format', null, 400);
    }

    // Validate full name length
    if (strlen($fullName) < 2) {
        sendResponse(false, 'Full name must be at least 2 characters', null, 400);
    }

    // Validate phone number
    if (strlen(preg_replace('/[^0-9]/', '', $phone)) < 10) {
        sendResponse(false, 'Phone number must be at least 10 digits', null, 400);
    }

    // Validate message length
    if (strlen($message) < 10) {
        sendResponse(false, 'Message must be at least 10 characters', null, 400);
    }

    // Get client IP and user agent
    $ipAddress = $_SERVER['REMOTE_ADDR'] ?? 'Unknown';
    $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';

    // Connect to database
    $database = new Database();
    $db = $database->getConnection();

    // Prepare SQL statement
    $query = "INSERT INTO contact_submissions 
              (full_name, email, phone, subject, message, ip_address, user_agent) 
              VALUES 
              (:full_name, :email, :phone, :subject, :message, :ip_address, :user_agent)";

    $stmt = $db->prepare($query);

    // Bind parameters
    $stmt->bindParam(':full_name', $fullName);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':subject', $subject);
    $stmt->bindParam(':message', $message);
    $stmt->bindParam(':ip_address', $ipAddress);
    $stmt->bindParam(':user_agent', $userAgent);

    // Execute query
    if ($stmt->execute()) {
        $submissionId = $db->lastInsertId();
        sendResponse(
            true, 
            'Thank you! Your message has been sent successfully. We will get back to you soon.', 
            ['submission_id' => $submissionId],
            201
        );
    } else {
        throw new Exception('Failed to save submission');
    }

} catch (PDOException $e) {
    error_log('Database error: ' . $e->getMessage());
    sendResponse(false, 'Database error occurred. Please try again later.', null, 500);
} catch (Exception $e) {
    error_log('Error: ' . $e->getMessage());
    sendResponse(false, $e->getMessage(), null, 500);
}
