package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.Tasks;

import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("description ");
        String deadline = req.getParameter("deadline");
        String status = req.getParameter("status");
        Tasks tasks = new Tasks();
        tasks.setId(Long.valueOf(id));
        tasks.setName(name);
        tasks.setDescription(description);
        tasks.setDeadlineDate(deadline);
        boolean parsedStatus;
        try {
            parsedStatus = Boolean.parseBoolean(status);
        } catch (IllegalArgumentException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid status value");
            return;
        }
        tasks.setStatus(parsedStatus);
        DBManager.updateTask(tasks);
        resp.sendRedirect("/tasks");
    }
}
