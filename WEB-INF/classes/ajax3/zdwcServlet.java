
package ajax3;
import ybl.common.CommonFunction;
import java.sql.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author nate
 * @version
 */
public class zdwcServlet extends HttpServlet {

    //private List names = new ArrayList();
	Vector vData = new Vector();
	public String GB2Uni(String GB) {
		//this is a method for servlet loading chinese data from db.
		try {
		    if (GB==null)
		    {
				return "";
		    }
			GB=GB.trim();
			byte[] tmp = GB.getBytes("8859_1"); //you must change the byte code
		    String result = new String(tmp);
		    return result;
		} 
		catch(java.io.UnsupportedEncodingException e) {
			System.out.println("CommonFunction.GB2Uni  UnsupportedEncodingException"+e);
			return null;
		}
	}


	//相当于request.getParameter();
	//request:JSP的request变量
	//csname:参数名
	public String  getParameter (javax.servlet.http.HttpServletRequest request,String csname) throws Exception
	{  
		String instr=java.net.URLDecoder.decode(request.getQueryString(),"UTF-8");

		String ret=null;
		if (instr==null || instr.equals("") || csname==null || csname.equals(""))
		{
			return null;
		}

		instr="&"+instr;

		int pos=instr.indexOf("&"+csname+"=");
		if (pos==-1)
		{
			return null;
		}


		int pos1=instr.indexOf("&",pos+1);
		if (pos1==-1)
		{
			ret=instr.substring(pos+csname.length()+2);
		}
		else{
			ret=instr.substring(pos+csname.length()+2,pos1);
		}

		return ret; 
	} 

	public void init(ServletConfig config) throws ServletException {
		    vData.add("军队");
			vData.add("军事");
			vData.add("Abh");
			vData.add("Asd");
			vData.add("Aer");
    }
    
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
	{
       
		CommonFunction cf=new CommonFunction();
		Connection conn  = null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=null;
		try {
		
			String prefix =getParameter(request,"names");
			System.out.println(prefix);
			prefix =GB2Uni(prefix);
			System.out.println(prefix);

			conn=cf.getConnection();    //得到连接


			response.setContentType("text/xml");
			request.setCharacterEncoding("GB2312");  
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.println("<response>");

			String yhmc=null;
			sql="select yhmc from sq_yhxx where yhmc like '"+prefix+"%'";
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next())
			{
				yhmc=rs.getString(1);

				//转换汉字到UTF8编码＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
				yhmc=java.net.URLEncoder.encode(yhmc,"UTF-8");

				out.println("<name>" + yhmc + "</name>");
			}
			rs.close();
			ps.close();

			out.println("</response>");
			out.close();

		}
		catch (Exception e) {
			System.out.println("executeQuery :" + e+"  SQL="+sql);
		}
		finally 
		{
			try{
				if (rs!= null) rs.close(); 
				if (ps!= null) ps.close(); 
				if (conn != null) cf.close(conn); //释放连接
			}
			catch (Exception e){
				if (conn != null) cf.close(conn);    //释放连接
			}
		}
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
        
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
}
