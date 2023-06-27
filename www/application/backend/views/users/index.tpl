{include file='header.tpl'}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Пользователи</li>
</ul>

<a href="#add_user" class="btn btn-primary" role="button" data-toggle="modal">Создать пользователя</a>
<br><br>
<!--modal-->
<div id="add_user" class="modal hide fade">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создание пользователя</h3>
	</div>

	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/users/add">
            <div class="control-group">
                <label class="control-label">Логин</label>
                <div class="controls">
                    <input type="text" name="login" placeholder="Логин">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Пароль</label>
                <div class="controls">
                    <input type="password" name="password" placeholder="Пароль">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Группа</label>
                <div class="controls">
                    <select name="group">
                        {foreach from=$groups item=group}
                        <option value={$group.name}>{$group.name}</option>
                        {/foreach}
                    </select>
                </div>
            </div>

			<div class="controls">
				<button class="btn btn-primary" type="submit">Сохранить</button>
			</div>
		</form>
	</div>
</div>
<!--/modal-->
    <table class="table">
	<thead>
		<th>Логин</th>
		<th>Группа</th>
		<th>Действия</th>
	</thead>

	{foreach from=$users item=user}
	<tr>
		<td>{$user.login}</td>
		<td>{$user.group}</td>
		<td>
			<a href="#edit{$user.Id}" role="button" data-toggle="modal" class="btn btn-primary">Редактировать</a>
			<a href="/admin/users/delete/{$user.Id}" class="btn btn-danger">Удалить</a>
			<div id="edit{$user.Id}" class="modal hide fade">
                <form class="form-horizontal" method="POST" action="/admin/users/edit/{$user.Id}">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>Редактировать пользователя</h3>
                    </div>
                    <br>

                    <div class="control-group">
                        <label class="control-label">Логин</label>
                        <div class="controls">
                            <input type="text" name="login" placeholder="Логин" value="{$user.login}">
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Пароль</label>
                        <div class="controls">
                            <input type="password" name="password" placeholder="Пароль">
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Группа</label>
                        <div class="controls">
                            <select name="group">
                                {foreach from=$groups item=group}
                                <option value={$group.name} {if $user.group == $group.name}selected{/if}>{$group.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </form>
			</div>
		</td>
	</tr>
    {/foreach}
    </table>
{include file='footer.tpl'}
