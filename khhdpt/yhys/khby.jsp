<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>

<html>
<head>
<title>有话要说</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="/khhdpt/images/stype.css" rel=stylesheet type=text/css>
</head>
<%
String khbh=(String)session.getAttribute("khbh");
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,lxfs,fwdz,hth";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_dwxx,dm_gcyszxmbm a,dm_gcyszxmbm b";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.ybysxmbm=a.gcyszxmbm(+) and crm_khxx.zqysxmbm=b.gcyszxmbm(+)  ";
	ls_sql+=" and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF"  style='FONT-SIZE: 13px'>
<table width="100%" border="0" height="834" style='FONT-SIZE: 13px'>
  <tr>
    <td width="12%" background="/khhdpt/images/jieshao_4-1.jpg" valign="top"> 
      <table width="114" height="834" border="0" cellpadding="0" cellspacing="0"  style='FONT-SIZE: 13px'>
        <tr> 
          <td valign="top" background="../images/jieshao_4-1.jpg"> 
            <table width="132" border="0"  style='FONT-SIZE: 13px'>
              <tr> 
                <td width="25" height="18">&nbsp;</td>
                <td width="97">&nbsp;</td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/11.gif" ></div></td>
                <td width="97"><A HREF="YhysIndex.jsp">我要投诉</A></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/14.gif" ></div></td>
                <td width="97"><A HREF="khby.jsp">我要表扬</A></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/red_forum.gif" width="25"></div></td>
                <td width="97"><A HREF="hlhjy.jsp">合理化建议</a></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/032.gif"  width="25"></div></td>
                <td width="97"><A HREF="khly.jsp">我要留言</a></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src='../tubiao/iconMailBlue_16x16.gif' ></div></td>
                <td width="97"><A HREF="zjlxx.jsp">总经理信箱</a></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="88%" valign="top"> 目前位置－->有话要说－->我要表扬 
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
        <tr> 
          <td width="19%" height="24" align="right" bgcolor="#E4E4E4" >姓名</td>
          <td width="31%" ><%=khxm%>（<%=lxfs%>） </td>
          <td width="19%" align="right" bgcolor="#E4E4E4" >合同号</td>
          <td width="31%" ><%=hth%></td>
        </tr>
        <tr> 
          <td width="19%" height="24" align="right" bgcolor="#E4E4E4">房屋地址</td>
          <td colspan="3"><%=fwdz%></td>
        </tr>
      </table>
<form method="post" action="" name="insertform" target='_blank'>
        <table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 13px;width:100.0%;background:#F6F6F6'>
          <tr bgcolor="#FFFFFF">
            <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"><font color="#FF0000">*</font>是否要求回复</td>
            <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%">
              <input type="radio" name="sfyqhf" value="1">不需回复
              <input type="radio" name="sfyqhf" value="2">必须回复
              <input type="radio" name="sfyqhf" value="3" checked>
              无要求
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' align="right" height="32" width="19%"> 
              <font color="#FF0000">*</font>表 扬 内 容&nbsp;<BR>
              <BR>
              <input type="hidden" name="khbh" value="<%=khbh%>" >
              <input type="button" name="tjly" value="提交表扬" onclick="f_do(insertform)">
            </td>
            <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
              <textarea name="lynr" rows="7" cols="75"></textarea>
            </td>
          </tr>
        </table>
</form>

<%
	String lysj=null;
	String lynr=null;
	String sfyqhf=null;
	String lysfyck=null;
	String lyckr=null;
	String lycksj=null;
	String lyhfnr=null;

	int row =0;
	ls_sql="select lysj,lynr,sfyqhf,lysfyck,lyckr,lycksj,lyhfnr";
	ls_sql+=" from  hd_khly";
	ls_sql+=" where khbh='"+khbh+"' and lylx='4' ";//1：工程留言；2：集成留言；3：客户投诉；4：客户表扬；5：客户建议；6：总经理信箱；9：其它留言
	ls_sql+=" order by lyxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		row++;
		lysj=cf.fillNull(rs1.getDate("lysj"));
		lynr=cf.fillNull(rs1.getString("lynr"));
		sfyqhf=cf.fillNull(rs1.getString("sfyqhf"));
		lysfyck=cf.fillNull(rs1.getString("lysfyck"));
		lyckr=cf.fillNull(rs1.getString("lyckr"));
		lycksj=cf.fillNull(rs1.getDate("lycksj"));
		lyhfnr=cf.fillNull(rs1.getString("lyhfnr"));

		if (sfyqhf.equals("1"))//1：不需回复；2：必须回复；3：无要求
		{
			sfyqhf="（不需回复）";
		}
		else if (sfyqhf.equals("2"))//1：不需回复；2：必须回复；3：无要求
		{
			sfyqhf="（必须回复）";
		}
		else if (sfyqhf.equals("3"))//1：不需回复；2：必须回复；3：无要求
		{
			sfyqhf="";
		}

		%>
		<table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 14px;width:100.0%;background:#F6F6F6'>
		  <tr bgcolor="#FFFFFF"> 
			<td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="19%">
			<%=row%>：<%=lysj%>留言<%=sfyqhf%>：<%=lynr%>
			</td>
		  </tr>
		  <tr bgcolor="#FFFFFF"> 
			<td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%">
			<%
			if (lysfyck.equals("Y"))//N：未查看；Y：已查看
			{
				if (lyhfnr.equals(""))//留言回复内容
				{
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" 于 "+lycksj+" 查看");
				}
				else{
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" 于 "+lycksj+" 回复："+lyhfnr);
				}
			}
			else{
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconMailBlue_16x16.gif'>留言未查看");
			}
			%>
			</td>
		  </tr>
		</table>
		<%
	}
	rs1.close();
	ps1.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
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
	if(	!radioChecked(FormName.sfyqhf)) {
		alert("请选择[是否要求回复]！");
		FormName.sfyqhf[0].focus();
		return false;
	}

	if(	javaTrim(FormName.lynr)=="" || FormName.lynr.value=="请您填写表扬内容！不要超过300个汉字") {
		alert("请您填写表扬内容！");
		FormName.lynr.value="请您填写表扬内容！不要超过300个汉字";
		FormName.lynr.select();
		return false;
	}

	FormName.action="SaveKhly.jsp?lylx=4";//1：工程留言；2：集成留言；3：客户投诉；4：客户表扬；5：客户建议；6：总经理信箱；9：其它留言
	FormName.submit();
	FormName.tjly.disabled=true;
	return true;
}

//-->
</SCRIPT>
