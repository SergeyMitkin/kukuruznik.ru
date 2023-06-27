{include file="header.tpl"}
<style type="text/css">
      body {
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 40px auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

</style>
<div class="container">
      <form class="form-signin" method="POST" action="/admin/login/auth">
        <h2 class="form-signin-heading">Идентификация</h2>
        <input class="input-block-level" placeholder="Логин" type="text" name="login">
        <input class="input-block-level" placeholder="Password" type="password" name="password">
        <button class="btn btn-large btn-primary" type="submit">Войти</button>
      </form>
</div>
{include file="footer.tpl"}
