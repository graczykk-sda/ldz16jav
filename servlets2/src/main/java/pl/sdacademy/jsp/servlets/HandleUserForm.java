package pl.sdacademy.jsp.servlets;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pl.sdacademy.jsp.beans.User;
import pl.sdacademy.jsp.repository.UserRepository;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(
        name = "handleUserForm",
        value = "/handle-user-form"
)
public class HandleUserForm extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ServletFileUpload.isMultipartContent(req)) {
            return;
        }
        ServletFileUpload upload = configureFileUpload();

        User user = new User();
        getParameters(upload, req)
                .forEach(param -> processParameter(param, user));

        saveToDb(user);

        resp.sendRedirect("user-form.jsp?userAdded=true");
    }

    private void saveToDb(User user) {
        new UserRepository().save(user);
    }

    private void processParameter(FileItem item, User user) {
        try {
            if (item.isFormField()) {
                processFormField(item, user);
            } else {
                processUploadedFile(item, user);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    private List<FileItem> getParameters(ServletFileUpload upload, HttpServletRequest req) {
        try {
            return upload.parseRequest(req);
        } catch (FileUploadException e) {
            throw new RuntimeException("Parse request exception", e);
        }
    }

    private ServletFileUpload configureFileUpload() {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        System.out.println("temp repository: " + repository.getAbsolutePath());
        factory.setRepository(repository);
        return new ServletFileUpload(factory);
    }

    private void processUploadedFile(FileItem item, User user) {
        String contextPath = getServletContext().getRealPath("") + "upload";
        File uploadDir = new File(contextPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String uploadPath = contextPath + File.separator + item.getName();
        System.out.println("upload path: " + uploadPath);
        File file = new File(uploadPath);
        try {
            item.write(file);
            String relativePath = getServletContext().getContextPath() + "/upload/" + item.getName();
            user.setPhoto(relativePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void processFormField(FileItem item, User user) throws UnsupportedEncodingException {
        String param = item.getFieldName();
        switch (param) {
            case "name":
                user.setName(item.getString("UTF-8"));
                break;
            case "surname":
                user.setSurname(item.getString("UTF-8"));
                break;
            case "email":
                user.setEmail(item.getString("UTF-8"));
                break;
        }
    }
}
