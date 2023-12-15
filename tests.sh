#!/bin/bash
echo "Tests para la gestión de usuarios"
#Login: 
echo "Login"
curl -X POST "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/user/login" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"username\":\"newuser\",\"password\":\"6789\"}"
#Register: 
echo "Register"
curl -X POST "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/user" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"password\":\"1234\",\"userId\":\"1\",\"recoveryEmail\":\"rick@email.com\",\"email\":\"fred@email.com\",\"username\":\"frederick62\"}"
#Logout:
echo "Logout" 
curl -X POST "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/user/logout" -H  "accept: application/json"
#Search user: 
echo "Search user"
curl -X GET "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/user/1" -H  "accept: application/json"
#Edit user: 
echo "Edit user"
curl -X PUT "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/user/1" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"username\":\"newusername\",\"email\":\"freshemail@email.com\",\"recoveryemail\":\"recoverymail@email.es\",\"password\":\"password1234\"}"
#Delete user: 
echo "Delete user"
curl -X DELETE "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/user/1" -H  "accept: application/json"
#Forgot password: 
echo "Forgot password"
curl -X POST "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/fred/forgot-password" -H  "accept: application/json"
#Get subscription: 
echo "Get subscription"
curl -X GET "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/1/subscription" -H  "accept: application/json"
#Edit subscription: 
echo "Edit subscription"
curl -X PUT "https://usermanagement-production-e3f4.up.railway.app/JCASCOSE/UserManagement/1.0.0/api/user-management/1/subscription?subscription=2" -H  "accept: application/json"

echo "Tests para gestión de streaming"
#Start streaming: 
echo "Start streaming"
curl -X POST "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/streaming" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"owner\":\"{}\",\"streamingId\":\"1\",\"description\":\"Doing my first stream\",\"title\":\"First stream\"}"
#Receive streaming: 
echo "Receive streaming"
curl -X GET "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/streaming/1" -H  "accept: application/json"
#Edit streaming: 
echo "Edit streaming"
curl -X PUT "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/streaming/1?title=New%20title&description=New%20description" -H  "accept: application/json"
#Delete streaming: 
echo "Delete streaming"
curl -X DELETE "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/streaming/1" -H  "accept: application/json"
#Moderate streaming: 
echo "Moderate streaming"
curl -X POST "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/streaming/1/moderate?moderation=2" -H  "accept: application/json"
#End streaming: 
echo "End streaming"
curl -X POST "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/streaming/1/end" -H  "accept: application/json"
#Send message: 
echo "Send message"
curl -X POST "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/message" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"messageType\":3,\"receiver\":\"2\",\"messageId\":\"1\",\"emitter\":\"1\",\"content\":\"Hello\"}"
#Receive message: 
echo "Receive message"
curl -X GET "https://streamingmanagement-production.up.railway.app/JCASCOSE/StreamingManagement/1.0.0/api/streaming/message/1" -H  "accept: application/json"

echo "Tests para almacenamiento en la nube"
#Upload video: 
echo "Upload video"
curl -X POST "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"streamingId\":\"1\",\"title\":\"First stream\",\"description\":\"Doing my first stream\",\"owner\":\"1\"}"
#Edit video: 
echo "Edit video"
curl -X PUT "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/1?title=New%20title&description=New%20description" -H  "accept: application/json"
#Delete video: 
echo "Delete video"
curl -X DELETE "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/1" -H  "accept: application/json"
#Play video: 
echo "Play video"
curl -X GET "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/1/play" -H  "accept: application/json"
#Stop video: 
echo "Stop video"
curl -X POST "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/1/stop" -H  "accept: application/json"
#Resume video: 
echo "Resume video"
curl -X POST "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/1/resume?time=5681" -H  "accept: application/json"
#Search video: 
echo "Search video"
curl -X GET "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/search/Expo2023" -H  "accept: application/json"
#Edit parameters: 
echo "Edit parameters"
curl -X PUT "https://cloudstorage-production.up.railway.app/JCASCOSE/CloudStorage/1.0.0/api/cloud-storage/video/1/parameters?quality=1080&speed=1.5" -H  "accept: application/json"

