# Spring-Boot-SQS-Localstack

https://medium.com/@anujpatel2809/spring-boot-with-sqs-localstack-46b3b8c79e80
===============
$ aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name MuraliQueue
{
"QueueUrl": "http://localhost:4566/000000000000/MuraliQueue"
}
========================
OfficeWork@DESKTOP-SLU6JHH MINGW64 /D/Softwares/AwsLocalStack
$ aws --endpoint-url=http://localhost:4566 sqs receive-message --queue-url http://localhost:4566/queue/MuraliQueue --max-number-of-messages 10
{
"Messages": [
{
"MessageId": "00689a20-65b1-4141-a1e1-a5ce12347a90",
"ReceiptHandle": "ZTlmMjUzN2MtYTZhZS00NzY4LWFhZWMtODgzZjM0ZGM3NjhiIGFybjphd3M6c3FzOnNhLWVhc3QtMTowMDAwMDAwMDAwMDA6TXVyYWxpUXVldWUgMDA2ODlhMjAtNjViMS00MTQxLWExZTEtYTVjZTEyMzQ3YTkwIDE2NzE3MjExODAuMzgzMzE5NA==",
"MD5OfBody": "3ef72f8e6cea6867bba6f13e7c27589c",
"Body": "{\"name\":\"John\",\"age\":30,\"car\":null}"
}
]
}
========================