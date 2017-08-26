<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String dwbh=null;
String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jhybgcrq=null;
String jgrq=null;
String gcjdbm=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String bz=null;
String wgbz=null;

String hdbz=null;
String khlxbm=null;
String cgdz=null;
String hdr=null;
String ssfgs=null;


String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,xb,fwdz,cqbm,lxfs,hth,sjs,qye,qyrq,jyjdrq,jhybgcrq,jgrq,gcjdbm,sgd,sgbz,zjxm,khlxbm,bz,dwbh,kgrq,cgdz,hdr,hdbz,khlxbm ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jhybgcrq=cf.fillNull(rs.getDate("jhybgcrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		bz=cf.fillNull(rs.getString("bz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));

		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
	}
	rs.close();

	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx ";
	ls_sql+=" where  dwbh='"+dwbh+"' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>设工程担当、施工班长</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>

<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">换工程担当</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXgCrm_khxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>              </td>
              <td width="34%"> <%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">联系方式</font></div>              </td>
              <td width="35%"><%=lxfs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>              </td>
              <td width="34%"> <%=khxm%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">性别</font></div>              </td>
              <td width="35%"><%
	cf.radioToken(out,"M+男&W+女",xb,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">所属城区</font></div>              </td>
              <td width="34%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"'",cqbm,true);
%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>              </td>
              <td width="35%"> <%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">签约额</font></div>              </td>
              <td width="34%"> <%=qye%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>              </td>
              <td width="35%"> <%=qyrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">回单标志</font></div>              </td>
              <td width="34%"> <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">回单人</font></div>              </td>
              <td width="35%"> <%=hdr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">建议交底日期</font></td>
              <td width="34%"> <%=jyjdrq%> </td>
              <td width="15%" align="right"><font color="#0000CC">工程进度</font></td>
              <td width="35%"><%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm where gcjdbm='"+gcjdbm+"'",gcjdbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">合同开工日期</font></div>              </td>
              <td width="34%"> <%=kgrq%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">合同竣工日期</font></div>              </td>
              <td width="35%"> <%=jgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="16%" align="right"><font color="#0000CC">施工队</font></td>
              <td width="34%"> <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="15%" align="right"><font color="#0000CC">关系客户</font></td>
              <td width="35%"> <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm where khlxbm='"+khlxbm+"'",khlxbm,true);
%></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="16%" bgcolor="#FFCCCC"> 
                <div align="right">工程担当</div>              </td>
              <td width="34%"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%> 
                </select>              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="16%" align="right">换工程担当说明</td>
              <td colspan="3"> 
                <textarea name="hzjxmsm" rows="3" cols="71"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
				<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
				<input type="hidden" name="oldzjxm"  value="<%=zjxm%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
            </tr>
          </table>
</form>

	  
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
	if(	javaTrim(FormName.zjxm)=="") {
		alert("请输入[工程担当]！");
		FormName.zjxm.focus();
		return false;
	}
	if (FormName.zjxm.value!=FormName.oldzjxm.value)
	{
		if(	javaTrim(FormName.hzjxmsm)=="") {
			alert("请输入[换工程担当说明]！");
			FormName.hzjxmsm.focus();
			return false;
		}
	}
/*
	if(	javaTrim(FormName.sgbz)=="") {
		alert("请输入[施工班组]！");
		FormName.sgbz.focus();
		return false;
	}
*/	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
