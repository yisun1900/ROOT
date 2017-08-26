<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,java.text.SimpleDateFormat'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>录入数据</title>

</head>
<body>
<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String khbh=request.getParameter("khbh");
//String fkxh=request.getParameter("fkxh");
String hth=request.getParameter("hth");
String fkcs=request.getParameter("fkcs");
String yfkje2=request.getParameter("yfkje");
Double yfkje=Double.valueOf(yfkje2);
String yfksj2=request.getParameter("sksj");
SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd");
java.util.Date yfksj = sdf.parse(yfksj2);
String jhms=request.getParameter("jhms");
String fkcsmc=null;
if(jhms!=null&&!"".equals(jhms))
	jhms=new String(jhms.getBytes("iso-8859-1"),"gbk");
	//System.out.println(jhms);
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps=null;
String ls_sql=null;
String fkjhxh=request.getParameter("id");

try{
			
		conn=cf.getConnection();
		
				
				ls_sql="select fkcsmc from cw_fkcs where fkcs='"+fkcs+"'";
				ps= conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())
				{
					fkcsmc=rs.getString(1);
				}
				rs.close();
				ps.close();


		String url = cf.getValue("kb_url");
		System.out.println(url);
        Service service = new Service();
            Call call;
			String custName=null;
			String address=null;
			String cellPhone=null;
			//Customer customer=new Customer();
				if(fkjhxh==null||"".equals(fkjhxh))
				{
					int count=0;
					ls_sql="select NVL(max(substr(fkjhxh,8,4)),0)";
					ls_sql+=" from  cw_jzfkjh";
					ls_sql+=" where khbh='"+khbh+"'  ";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery(ls_sql);
					if (rs.next())
					{
						count=rs.getInt(1);
					}
					rs.close();
					ps.close();

					fkjhxh=khbh+cf.addZero(count+1,4);
				}
                 call = (Call) service.createCall();
				
				 call.setTargetEndpointAddress(new java.net.URL(url) );
                 call.setOperationName("newOrUpdatePayPlan");// 这是要调用的方法
                 String res = (String) call.invoke(new Object[]{fkjhxh,hth,fkcsmc,yfkje,yfksj,jhms,lrr});
				 //out.println(res);
				 String fkjhxh2=request.getParameter("id");
                if("yes".equals(res))
				{
							//插入本地数据库
				if(fkjhxh2!=null&&!"".equals(fkjhxh2))
				{
					ls_sql="update cw_jzfkjh set fkcs='"+fkcs+"',yfksj=TO_DATE('"+yfksj2+"','YYYY-MM-DD'), ";
					ls_sql+=" yfkje='"+yfkje+"',lrr='"+lrr+"',lrsj=TO_DATE('"+cf.today()+"','YYYY-MM-DD'),lrbm='"+lrbm+"',bz='"+jhms+"' ";
					ls_sql+=" where fkjhxh='"+fkjhxh+"'"; 
					//out.println(ls_sql);
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else
				{
					
					
					ls_sql="insert into cw_jzfkjh(fkjhxh,khbh,fklxbm,fkcs,yfksj,yfkje,fkzt,lrr,lrsj,lrbm,bz) values('"+fkjhxh+"','"+khbh+"','11','"+fkcs+"',TO_DATE('"+yfksj2+"','YYYY-MM-DD'),'"+yfkje+"','N','"+lrr+"',SYSDATE,'"+lrbm+"','"+jhms+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				//完成插入
		%>
		<script type="text/javascript">
			alert("录入成功");
			//window.close();
		</script>
		<%
				}
			 else
				{
				 out.println("录入失败，系统异常："+res);
		
				}
		
				//Object [] a=new Object{};
			}catch (Exception e) {
					out.print("Exception: " + e);
					return;
				}
				finally 
				{
					try{
						if (rs != null) rs.close(); 
						if (ps != null) ps.close(); 
						if (conn != null) cf.close(conn); 
					}
					catch (Exception e){
						if (conn != null) cf.close(conn); 
					}
				}
        
      
 %>
</body>
</html>