<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="color-scheme" content="light">
    <meta name="supported-color-schemes" content="light">
    <title>Provider Login</title>
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

        .icon {
            margin: 20px auto;
            display: flex;
            justify-content: center;
        }

        .message {
            padding: 20px;
            font-size: 18px;
            color: #3d4852;
            text-align: center;
        }

        .note {
            margin-top: 20px;
            font-size: 16px;
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
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="content">
            <div class="header">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M5 3l14 9-14 9V3z" />
                </svg>
                <h1>Postify</h1>
            </div>

            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle" width="80" height="80" style="color: #38a169;">
                    <path d="M9 12l2 2 4-4"></path>
                    <circle cx="12" cy="12" r="10"></circle>
                </svg>
            </div>

            <div class="message">
                <p>Successfully logged in.</p>
            </div>

            <div class="note">
                <p>You can close this window</p>
            </div>

            <div class="footer">
                <p>&copy; 2024 Postify. All rights reserved.</p>
            </div>
        </div>
    </div>
</body>

</html>