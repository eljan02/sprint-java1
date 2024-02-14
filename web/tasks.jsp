<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.Tasks" %>
<%@ page import="db.DBManager" %>
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
<%@ include file="navbar.jsp" %>
    <br>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    + Добавить задание
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
           <form action="/addTask" method="post">
               <div class="modal-body">
                   <div class="mb-3">
                       <label for="exampleInputEmail1" class="form-label">Наименование:</label>
                       <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                   </div>
                   <div class="mb-3">
                       <label for="exampleInputEmail1" class="form-label">Описание:</label>
                       <textarea name="description" class="form-control"></textarea>
                   </div>
                   <div class="mb-3">
                       <label for="exampleInputEmail1" class="form-label">Крайний срок:</label>
                       <input name="deadline" type="date" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                   </div>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                   <button type="submit" class="btn btn-primary">Добавить</button>
               </div>
           </form>
        </div>
    </div>
</div>
<br><br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполнено</th>
            <th scope="col" width="10%">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
        ArrayList<Tasks>tasks = DBManager.getAllTasks();
        if(tasks!=null){
            for (int i = 0; i < tasks.size(); i++) {

        %>

        <tr>
            <td><%=tasks.get(i).getId()%></td>
            <td><%=tasks.get(i).getName()%></td>
            <td><%=tasks.get(i).getDeadlineDate()%></td>
            <%
            if (tasks.get(i).isStatus()==true){
                %>
            <td>Да</td>
            <%
            }else {
                %>
            <td>Нет</td>
            <%
            }
            %>

            <td>
                <a href="/details?id=<%=tasks.get(i).getId()%>" class="btn btn-primary">Детали</a>
            </td>
        </tr>
        <%
            }}
        %>
        </tbody>
    </table>
</div>
</body>
</html>
