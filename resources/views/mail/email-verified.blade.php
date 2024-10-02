<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="color-scheme" content="light">
    <meta name="supported-color-schemes" content="light">

    <title>Email Verified</title>

    <style>
        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: #edf2f7;
            color: #718096;
            margin: 0;
            padding: 0;
            line-height: 1.5;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .wrapper {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-color: #edf2f7;
        }

        .content {
            max-width: 600px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            padding: 20px;
        }

        .header {
            background-color: #3d4852;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .header svg {
            width: 50px;
            height: 50px;
        }

        .header h1 {
            margin: 10px 0;
            font-size: 24px;
            font-weight: bold;
        }

        .message {
            padding: 20px;
            font-size: 18px;
            color: #3d4852;
            text-align: center;
        }

        .footer {
            background-color: #f8fafc;
            color: #b0adc5;
            font-size: 12px;
            padding: 20px;
            text-align: center;
        }

        @media only screen and (max-width: 600px) {
            .content {
                width: 100%;
            }
        }

        .countdown {
            margin-top: 20px;
            font-size: 16px;
            color: #3d4852;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="content">
            <div class="header">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a3 3 0 003.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
                <h1>Postify</h1>
            </div>

            <div class="message">
                <p>{{$message}}</p>
            </div>

            <div class="countdown">
                <p>You can close this window or wait for <span id="countdown">5</span> seconds...</p>
            </div>

            <div class="footer">
                <p>&copy; 2024 Postify. All rights reserved.</p>
            </div>
        </div>
    </div>

    <script>
        let countdownElement = document.getElementById('countdown');
        let countdownValue = 5;

        function updateCountdown() {
            if (countdownValue <= 0) {
                window.close();
            } else {
                countdownElement.textContent = countdownValue;
                countdownValue--;
            }
        }

        setInterval(updateCountdown, 1000);
    </script>
</body>

</html>