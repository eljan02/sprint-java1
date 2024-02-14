package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tasks.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        Tasks task = DBManager.getTask(id);
        req.setAttribute("OneTask", task);
        req.getRequestDispatcher("details.jsp").forward(req,resp);
    }
}

