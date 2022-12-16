package Staff_Management;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/Staff")
public class Staff extends HttpServlet implements Servlet {

    private static final long serialVersionUID = 1L;

    public Staff() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String title = "Newark Medical Association";
        int radio = 1;

        String query = "";
        String lookupStaffType = "";
        String regResult = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Newark_Medical?user=root&password=hskid1");

            Statement stmt = con.createStatement();

//            stmt.execute(con.getSchema());

// Bulk Staff-Type Lookup
            lookupStaffType = request.getParameter("lookupStaffType");
            if (lookupStaffType.equals("no_type")) {
                out.println("<html>\n" + "<head><title>" + title + "</title></head>\n" + "<body bgcolor= \"slateblue\">\n"
                        + "</br></br></br>");
                out.println("<h2 align=\"center\"> <font color='white'>" + "Oopsie! You must select a job type." + "</h2>");
                out.println("</body></html>");
            } else if (lookupStaffType.equals("Nurses"))
                query = "select * from Nurses";

            else if (lookupStaffType.equals("Clinical_Personnel"))
                query = "select * from Clinical_Personnel";

            else if (lookupStaffType.equals("Primary_Care_Physician"))
                query = "select * from PC_Physician";

            else if (lookupStaffType.equals("Surgeon"))
                query = "select * from Surgeon";

            // out.println("<tr><th>SurgeonID</th><th>Surgeon_Name</th><th>Surgery_Skills</th><th>Speciality</th><tr>");

            ResultSet rs = stmt.executeQuery(query);
            out.println("<html>\n" + "<head><title>" + title + "</title></head>\n"
                    + "<body bgcolor= \"slateblue\">\n" + "<table align=\"center\" border=3 width=25% height=25%>");

            if (lookupStaffType.equals("Nurses"))
                while (rs.next()) {
                    String sID = rs.getString("SurgeonID");
                    String sName = rs.getString("Surgeon_Name");
                    String sContract = rs.getString("Surgery_Skills");
                    String sSpecialty = rs.getString("Speciality");
                    out.println("<tr><td>" + sID + "</td><td>" + sName + "</td><td>" + sContract + "</td><td>" + sSpecialty + "</td></tr>");
                }
            else if (lookupStaffType.equals("Clinical_Personnel"))
                while (rs.next()) {
                    String sID = rs.getString("SurgeonID");
                    String sName = rs.getString("Surgeon_Name");
                    String sContract = rs.getString("Surgery_Skills");
                    String sSpecialty = rs.getString("Speciality");
                    out.println("<tr><td>" + sID + "</td><td>" + sName + "</td><td>" + sContract + "</td><td>" + sSpecialty + "</td></tr>");
                }
            else if (lookupStaffType.equals("Primary_Care_Physician"))
                while (rs.next()) {
                    String sID = rs.getString("SurgeonID");
                    String sName = rs.getString("Surgeon_Name");
                    String sContract = rs.getString("Surgery_Skills");
                    String sSpecialty = rs.getString("Speciality");
                    out.println("<tr><td>" + sID + "</td><td>" + sName + "</td><td>" + sContract + "</td><td>" + sSpecialty + "</td></tr>");
                }
            else if (lookupStaffType.equals("Surgeon"))
                while (rs.next()){
                    String sID = rs.getString("SurgeonID");
                    String sName = rs.getString("Surgeon_Name");
                    String sContract = rs.getString("Surgery_Skills");
                    String sSpecialty = rs.getString("Speciality");
                    out.println("<tr><td>" + sID + "</td><td>" + sName + "</td><td>" + sContract + "</td><td>" + sSpecialty + "</td></tr>");
                }

            out.println("</table>");
            out.println("</html></body>");

            stmt.close();

            String surgeon = request.getParameter("courseid");
            String semester = request.getParameter("semester");
            String course_name = rs.getString("courseName");

//if semester and course ID are not empty then:
            if (!courseId.isEmpty() && !semester.isEmpty()) {
                //check if input values are in the database
                //If this check returns true then
                //query = "Select * from courses where semester=input string & courseID=input string;
                reg_result = "You are registered for" + course_name + " in " + semester + "!";
            } else {
                reg_result = "So sorry! That course is not offered this semester!";
            }

            out.println("<html>\n" + "<head><title>" + title + "</title></head>\n" + "<body bgcolor= \"slateblue\">\n"
                    + "</br></br></br>");
            out.println("<h2 align=\"center\"> <font color='white'>" + reg_result + "</h2>");
            out.println("</body></html>");
            stmt.close();

            con.close();
        } catch (Exception ex) {

            System.out.println(ex);
            String courseId = request.getParameter("courseid");
            String semester = request.getParameter("semester");

            if (courseId.isEmpty() && semester.isEmpty()) {
                out.println("<html>\n" + "<head><title>" + title + "</title></head>\n" + "<body bgcolor= \"slateblue\">\n"
                        + "</br></br></br>");

                out.println("<font color='white'> <h2 align=\"center\">" + "You must insert a semester and course ID"
                        + "</h2>");

                out.println("</body></html>");
            }

        }
    }
}