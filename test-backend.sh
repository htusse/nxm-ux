#!/bin/bash

# ============================================
# Milestone 4 - Backend Integration Test Script
# ============================================

echo "🧪 Testing NXM Backend Integration"
echo "===================================="
echo ""

API_URL="http://localhost:8000/api/submit-form.php"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test counter
TESTS_PASSED=0
TESTS_FAILED=0

# Function to run test
run_test() {
    local test_name=$1
    local expected_result=$2
    local curl_command=$3
    
    echo -n "Testing: $test_name... "
    
    response=$(eval $curl_command 2>&1)
    
    if echo "$response" | grep -q "$expected_result"; then
        echo -e "${GREEN}✓ PASSED${NC}"
        ((TESTS_PASSED++))
    else
        echo -e "${RED}✗ FAILED${NC}"
        echo "  Expected: $expected_result"
        echo "  Got: $response"
        ((TESTS_FAILED++))
    fi
}

# ============================================
# Test 1: Valid Submission
# ============================================
echo "📝 Test 1: Valid Form Submission"
run_test "Valid submission" \
    '"success":true' \
    "curl -s -X POST $API_URL -H 'Content-Type: application/json' -d '{\"fullName\":\"John Smith\",\"email\":\"john.smith@example.com\",\"phone\":\"555-987-6543\",\"subject\":\"Product Inquiry\",\"message\":\"I am interested in learning more about your collagen products.\"}'"
echo ""

# ============================================
# Test 2: Email Validation
# ============================================
echo "📧 Test 2: Email Validation"
run_test "Invalid email format" \
    '"success":false' \
    "curl -s -X POST $API_URL -H 'Content-Type: application/json' -d '{\"fullName\":\"John Doe\",\"email\":\"invalid-email\",\"phone\":\"5551234567\",\"subject\":\"Test\",\"message\":\"This is a test message.\"}'"
echo ""

# ============================================
# Test 3: Required Fields
# ============================================
echo "✅ Test 3: Required Fields Validation"
run_test "Missing email field" \
    'Email is required' \
    "curl -s -X POST $API_URL -H 'Content-Type: application/json' -d '{\"fullName\":\"John Doe\",\"phone\":\"5551234567\",\"subject\":\"Test\",\"message\":\"Test message\"}'"
echo ""

# ============================================
# Test 4: Full Name Length
# ============================================
echo "👤 Test 4: Full Name Validation"
run_test "Full name too short" \
    'Full name must be at least 2 characters' \
    "curl -s -X POST $API_URL -H 'Content-Type: application/json' -d '{\"fullName\":\"A\",\"email\":\"test@example.com\",\"phone\":\"5551234567\",\"subject\":\"Test\",\"message\":\"This is a test message.\"}'"
echo ""

# ============================================
# Test 5: Phone Validation
# ============================================
echo "📞 Test 5: Phone Number Validation"
run_test "Phone number too short" \
    'Phone number must be at least 10 digits' \
    "curl -s -X POST $API_URL -H 'Content-Type: application/json' -d '{\"fullName\":\"John Doe\",\"email\":\"test@example.com\",\"phone\":\"123\",\"subject\":\"Test\",\"message\":\"This is a test message.\"}'"
echo ""

# ============================================
# Test 6: Message Length
# ============================================
echo "💬 Test 6: Message Length Validation"
run_test "Message too short" \
    'Message must be at least 10 characters' \
    "curl -s -X POST $API_URL -H 'Content-Type: application/json' -d '{\"fullName\":\"John Doe\",\"email\":\"test@example.com\",\"phone\":\"5551234567\",\"subject\":\"Test\",\"message\":\"Short\"}'"
echo ""

# ============================================
# Test 7: Method Not Allowed
# ============================================
echo "🚫 Test 7: HTTP Method Validation"
run_test "GET method not allowed" \
    'Method not allowed' \
    "curl -s -X GET $API_URL"
echo ""

# ============================================
# Test 8: CORS Headers
# ============================================
echo "🌐 Test 8: CORS Headers"
response=$(curl -s -I -X OPTIONS $API_URL)
if echo "$response" | grep -q "Access-Control-Allow-Origin"; then
    echo -e "Testing: CORS headers present... ${GREEN}✓ PASSED${NC}"
    ((TESTS_PASSED++))
else
    echo -e "Testing: CORS headers present... ${RED}✗ FAILED${NC}"
    ((TESTS_FAILED++))
fi
echo ""

# ============================================
# Test 9: Database Connection
# ============================================
echo "💾 Test 9: Database Verification"
count=$(mysql -u root -s -N -e "SELECT COUNT(*) FROM nxm_tsa.contact_submissions" 2>/dev/null)
if [ $? -eq 0 ] && [ "$count" -gt 0 ]; then
    echo -e "Testing: Database has records ($count total)... ${GREEN}✓ PASSED${NC}"
    ((TESTS_PASSED++))
else
    echo -e "Testing: Database connection... ${RED}✗ FAILED${NC}"
    ((TESTS_FAILED++))
fi
echo ""

# ============================================
# Test 10: Latest Submission
# ============================================
echo "🔍 Test 10: Latest Database Entry"
latest=$(mysql -u root -s -N -e "SELECT CONCAT(full_name, ' - ', email) FROM nxm_tsa.contact_submissions ORDER BY id DESC LIMIT 1" 2>/dev/null)
if [ $? -eq 0 ]; then
    echo -e "Testing: Latest submission retrieved... ${GREEN}✓ PASSED${NC}"
    echo "  Latest entry: $latest"
    ((TESTS_PASSED++))
else
    echo -e "Testing: Latest submission... ${RED}✗ FAILED${NC}"
    ((TESTS_FAILED++))
fi
echo ""

# ============================================
# Summary
# ============================================
echo "===================================="
echo "📊 Test Summary"
echo "===================================="
echo -e "${GREEN}Passed: $TESTS_PASSED${NC}"
echo -e "${RED}Failed: $TESTS_FAILED${NC}"
echo "Total:  $((TESTS_PASSED + TESTS_FAILED))"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed! Backend integration is working perfectly.${NC}"
    exit 0
else
    echo -e "${RED}⚠️  Some tests failed. Please review the errors above.${NC}"
    exit 1
fi
