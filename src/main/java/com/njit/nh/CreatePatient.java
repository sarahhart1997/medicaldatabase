package main.java.com.njit.nh;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/CreatePatient")
public class CreatePatient extends HttpServlet implements Servlet {

    private static final long serialVersionUID = 1L;

    public CreatePatient() {
        super();
    }
    private String messages;
    public void init() throws ServletException{
        messages = "The HttpServlet Class Demo";
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

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/Newark_Medical?user=root&password=hskid1");

            Statement stmt = con.createStatement();

//            stmt.execute(con.getSchema());

// Bulk Staff-Type Lookup from dropdown
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
                    out.println("<tr><td>" + sID + "</td><td>" + sName + "</td><td>" + sContract + "</td><td>"
                            + sSpecialty + "</td></tr>");
                }
            else if (lookupStaffType.equals("Clinical_Personnel"))
                while (rs.next()) {
                    String cpID = rs.getString("EmployeeID");
                    String cpSSN = rs.getString("SSN");
                    String cpName = rs.getString("Name");
                    String cpGender = rs.getString("Gender");
                    String cpAddress = rs.getString("Address");
                    String cpSalary = rs.getString("Salary");
                    String cpPhone = rs.getString("Phone");
                    out.println("<tr><td>" + cpID + "</td><td>" + cpSSN + "</td><td>" + cpName + "</td><td>"
                            + cpGender + "</td><td>" +cpAddress + "</td><td>" + cpSalary + "</td><td>" + cpPhone + "</td></tr>");
                }
            else if (lookupStaffType.equals("Primary_Care_Physician"))
                while (rs.next()) {
                    String pcID = rs.getString("PhysicianID");
                    String pcSpecialty = rs.getString("Specialty");
                    String pcPatientNo = rs.getString("No_Of_Patients");
                    String pcPatientID = rs.getString("PatientID");
                    String pcSalary = rs.getString("Salary");
                    out.println("<tr><td>" + pcID + "</td><td>" + pcSpecialty + "</td><td>" + pcPatientNo + "</td><td>"
                            + pcPatientID + "</td><td>" + pcSalary + "</td></tr>");
                }
            else if (lookupStaffType.equals("Surgeon"))
                while (rs.next()){
                    String sID = rs.getString("SurgeonID");
                    String sName = rs.getString("Surgeon_Name");
                    String sContract = rs.getString("Surgery_Skills");
                    String sSpecialty = rs.getString("Speciality");
                    out.println("<tr><td>" + sID + "</td><td>" + sName + "</td><td>" + sContract + "</td><td>"
                            + sSpecialty + "</td></tr>");
                }

            out.println("</table>");
            out.println("</html></body>");

            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}