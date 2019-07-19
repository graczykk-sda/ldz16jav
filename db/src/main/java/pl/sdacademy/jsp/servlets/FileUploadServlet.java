package pl.sdacademy.jsp.servlets;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pl.sdacademy.jsp.db.JdbcService;
import pl.sdacademy.jsp.domain.User;
import pl.sdacademy.jsp.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(
        name = "file-upload",
        urlPatterns = {"/file-upload"}
)
public class FileUploadServlet extends HttpServlet {

    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50;
    private static final String UPLOAD_DIRECTORY = "upload";

    private UserRepository userRepository;

    @Override
    public void init() {
        this.userRepository = new UserRepository(JdbcService.getConnection());
    }

    @Override
    public void destroy() {
        JdbcService.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("in servlet");
        assertMultipart(req);

        String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIRECTORY;
        System.out.println("upload path = " + uploadPath);
        ServletFileUpload upload = configureUpload(uploadPath);
        User user = new User();
        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(req);
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        item.write(storeFile);
                        user.setPhotoUrl(UPLOAD_DIRECTORY + File.separator + storeFile.getName());
                    } else {
                        switch (item.getFieldName()) {
                            case "name":
                                user.setName(item.getString());
                                break;
                            case "surname":
                                user.setSurname(item.getString());
                                break;
                        }
                    }
                }
            }
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }

        userRepository.save(user);
        req.setAttribute("saved", "true");
        getServletContext().getRequestDispatcher("/user-form.jsp").forward(req, resp);
    }

    private void assertMultipart(HttpServletRequest request) throws ServletException {
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException("request is not multipart");
        }
    }

    private ServletFileUpload configureUpload(String uploadPath) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        return upload;
    }
}
