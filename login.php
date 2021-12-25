<!DOCTYPE html>
<html>

<head>
    <?php include('header.php') ?>
    <?php
    session_start();
    if (isset($_SESSION['login_id'])) {
        header('Location:home.php');
    }
    ?>
    <title>Login | Online Quiz System</title>
</head>

<body id='login-body' class="bg-light" style="background-image: url(https://static.vecteezy.com/system/resources/previews/001/431/414/original/abstract-organic-flat-background-in-magenta-purple-free-vector.jpg); background-size: cover;">

    <div class="card col-md-6 offset-md-3 text-center  mb-4" style="background:#DA7F8F; border:solid rgb(148, 139, 139) 1px;">
        <br>
        <h3 class="he3-responsive text-black">Online Quiz System</h3>
        <br>
    </div> <br>
    <div class="card col-md-4 offset-md-4 mt-4">
        <div class="card-header-edge text-white">
            <strong style="color: black;"> Login</strong>
        </div>
        <div class="card-body">
            <form id="login-frm">
                <div class="form-group">
                    <label>Username</label>
                    <input type="username" name="username" class="form-control">
                </div>
                <div class="form-group">
                <label>Password</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group text-right">
                    <button style="background-color: #4CAF50;border: none;color: black;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px; " name="submit">Login</button>
                </div>

            </form>
        </div>
    </div>

</body>

<script>
    $(document).ready(function() {
        $('#login-frm').submit(function(e) {
            e.preventDefault()
            $('#login-frm button').attr('disable', true)
            $('#login-frm button').html('Please wait...')

            $.ajax({
                url: './login_auth.php',
                method: 'POST',
                data: $(this).serialize(),
                error: err => {
                    console.log(err)
                    alert('An error occured');
                    $('#login-frm button').removeAttr('disable')
                    $('#login-frm button').html('Login')
                },
                success: function(resp) {
                    if (resp == 1) {
                        location.replace('home.php')
                    } else {
                        alert("Incorrect username or password.")
                        $('#login-frm button').removeAttr('disable')
                        $('#login-frm button').html('Login')
                    }
                }
            })

        })
    })
</script>

</html>