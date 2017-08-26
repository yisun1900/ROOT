<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>订单跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%

		
		String orderId=request.getParameter("orderId");
		String YblState="";
		String ls_sql=null;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps=null;
            try {

				conn=cf.getConnection();
				ls_sql="select order_zt from jc_order_ybl where order_id='"+orderId+"'";
				ps= conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())
				{
					YblState=rs.getString(1);
				}
				rs.close();
				ps.close();
			}
			catch (Exception e) {
				out.print("Exception: " + e);
				return;
			}
			finally 
			{ 
				try{
					if (rs != null) rs.close(); 
					//if (stmt != null) stmt.close(); 
					if (conn != null) cf.close(conn); 
				}
				catch (Exception e){
					if (conn != null) cf.close(conn); 
				}
			}   
				 %>
  <form method="post" action="SaveGzOrder.jsp" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">订单跟踪</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
			
              <td > 
                <div align="right">订单编号</div>              </td>
				 
				 <td > 
                <div align="left"><%=orderId%></div>
				<input type="hidden" name="orderId" value="<%=orderId%>">
				
				</td>
			
				<td >
                <div align="right"><font color="#FF0033">*</font>家装订单状态</div>              </td>
				<td >
				<select name="YblState">
				 <option value=""></option>
                  <%
				  
		cf.selectItem(out,"select ztbm,ztmc from dm_orderzt  order by ztbm",YblState);
%> 
				</select>
				</td>
            </tr>
			 <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="73" rows="6"></textarea>
              </td>
            </tr>

				<tr bgcolor="#FFFFFF"align="center"> 
					<td colspan="4"><input type="button" value="保存" onclick="f_do(insertform)"></td>

				</tr>

				
				

           
          </table>


	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--





function f_do(FormName)//参数FormName:Form的名称
{
	if(javaTrim(FormName.YblState)=="") {
		alert("家装订单状态不能为空");
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
