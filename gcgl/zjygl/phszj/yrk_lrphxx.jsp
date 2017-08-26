<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>
<%

String yhdlm=(String) session.getAttribute("yhdlm");
String dwbh=(String) session.getAttribute("dwbh");

String dolx = request.getParameter("dolx");
String lrph = request.getParameter("lrph");

String lrr=null;
java.sql.Date lrsj=null;
String zdxh=null;
String sl=null;
String dwmc=null;
String bz=null;


String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接
	if (dolx.equals("new"))
	{
		//录入批号
		ls_sql="select NVL(max(lrph)+1,1)";
		ls_sql+=" from  crm_lrph";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			lrph=rs.getString(1);
		}
		ps.close();
		rs.close();

		ls_sql="select dwmc";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where  dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dwmc=rs.getString(1);
		}
		ps.close();
		rs.close();

		//生成录入批号
		lrsj=cf.getDate();
		lrr=yhdlm;
		bz="";

		ls_sql="insert into crm_lrph (lrph,lrr,lrsj,zdxh,sl,lx,wcbz,dwbh) values(?,?,?,0,0,'4','N',?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lrph);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.setString(4,dwbh);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql=" select lrph,lrr,lrsj,zdxh,sl,crm_lrph.bz,dwmc ";
		ls_sql+=" from crm_lrph,sq_dwxx ";
		ls_sql+=" where crm_lrph.dwbh=sq_dwxx.dwbh and lrph="+lrph;
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			lrph=rs.getString("lrph");
			lrr=rs.getString("lrr");
			lrsj=rs.getDate("lrsj");
			zdxh=rs.getString("zdxh");
			sl=rs.getString("sl");
			dwmc=rs.getString("dwmc");
			bz=cf.fillNull(rs.getString("bz"));
		}
		rs.close();
		ps.close();
	}
}
catch(Exception e){
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>
<HTML><HEAD>
<TITLE>录入批号信息</TITLE>
<BODY bgColor=#ffffff text="#000000" style='FONT-SIZE: 12px'>
<div align="center"><font size="4">录入批号信息</font> </div>
<FORM name="insertform" action="yrk_updatephxx.jsp" method="post">
    
  <table style='FONT-SIZE: 12px' cellspacing=2 cellpadding=2 width="100%" bgcolor=#999999 border=0>
    <tr bgcolor=#ffffff> 
      <td height="21" width="33%"> 
        <div align="right">录入批号</div>
      </td>
      <td colspan="2" height="21"> 
        <input type="text" name="lrph" maxlength="10" value="<%=lrph%>" readonly="true">
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td height="21" width="33%"> 
        <div align="right">录入人</div>
      </td>
      <td colspan="2" height="21"> 
        <input type="text" name="lrr" value="<%=lrr%>" maxlength="10" readonly="true">
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td height="21" width="33%"> 
        <div align="right">录入时间</div>
      </td>
      <td colspan="2" height="21"> 
        <input type="text" name="lrsj" value="<%=lrsj%>" maxlength="5" readonly="true">
      </td>
    </tr>
    <tr bgcolor=#ffffff>
      <td height="21" width="33%" align="right">录入单位</td>
      <td colspan="2" height="21">
        <input type="text" name="dwmc" value="<%=dwmc%>" maxlength="5" readonly="true">
      </td>
    </tr>
    <tr bgcolor=#ffffff> 
      <td height="21" width="33%"> 
        <div align="right">备注</div>
      </td>
      <td colspan="2" height="21"> 
        <textarea name="bz" cols="40" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td height=39 colspan="3"> 
        <div align="center"> 
          <input onClick="f_do(insertform)" type="submit" value="继续">
          <input type="reset" value="重输" name="reset" >
        </div>
      </td>
    </tr>
  </table>
  </FORM>
  
</BODY></HTML>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript>
<!--
function f_do(FormName) //参数FormName:Form的名称
{                      
	FormName.submit();
	return true;

}
//-->
</SCRIPT>
