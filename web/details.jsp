<%@ page import="tasks.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<%@ include file="navbar.jsp" %>
<br><br>
<%
    Tasks task = (Tasks) request.getAttribute("OneTask");
%>
    Наименование: <span><%=task.getName()%></span>
<br><br>
    Описание: <span><%=task.getDescription()%></span>
<br><br>
    Крайний срок: <span><%=task.getDeadlineDate()%></span>
<br><br>
    Выполнено: <span><%=task.isStatus()%></span>
<br><br>
<div style="display: flex">
    <div>
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Удалить
        </button>
    </div>
    <div style="margin-left: 10px">
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal1">
           Сохранить
        </button>
    </div>
</div>
    <!-- Modal for button UPDATE-->
    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Сохранить</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/update" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <input type="hidden" name="id" value="<%=task.getId()%>">
                            <label for="exampleInputEmail1" class="form-label">Наименование:</label>
                            <input name="name" value="<%=task.getName()%>" type="text" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Описание:</label>
                            <input name="description" value="<%=task.getDescription()%>" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Крайний срок:</label>
                            <input name="deadline" value="<%=task.getDeadlineDate()%>" type="date" class="form-control" id="exampleInputEmail3" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Статус:</label>
                            <select name="status" class="form-select" id="status">
                                <option value="true" <%= task.isStatus() ? "selected" : "" %>>Выполнено</option>
                                <option value="false" <%= !task.isStatus() ? "selected" : "" %>>Не выполнено</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-primary">Сохранить </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<!-- Modal for button DELETE-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Удалить</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/delete" method="post">
                <div class="modal-body">
                    <input type="hidden" name="id" value="<%=task.getId()%>">
                    <h3 style="text-align: center">Вы хотите удалить данное задание?</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                    <button type="submit" class="btn btn-primary">Да</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>
