<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String lrzjxm=cf.GB2Uni(request.getParameter("zjxm"));
	String yhdlm=(String)session.getAttribute("yhdlm");
%>
<%
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
String hdsgd=null;
String ssfgs=null;


Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String jhbh=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select khxm,xb,fwdz,cqbm,lxfs,hth,sjs,qye,qyrq,jyjdrq,jhybgcrq,jgrq,gcjdbm,sgd,sgbz,zjxm,khlxbm,bz,dwbh,kgrq,cgdz,hdsgd,hdbz,khlxbm ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
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
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
	}
	rs.close();

	int count=0;
	ls_sql="select NVL(max(substr(jhbh,8,2)),0)";
	ls_sql+=" from  kp_xjgdjh";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	jhbh=khbh+cf.addZero(count+1,2);
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
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入巡检工地计划</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_xjgdjh.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="35%"> <%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">联系方式</font></div>
              </td>
              <td width="35%"><%=lxfs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="35%"> <%=khxm%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">性别</font></div>
              </td>
              <td width="35%"><%
	cf.radioToken(out,"M+男&W+女",xb,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">所属城区</font></div>
              </td>
              <td width="35%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"'",cqbm,true);
%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>
              </td>
              <td width="35%"> <%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">签约额</font></div>
              </td>
              <td width="35%"> <%=qye%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="35%"> <%=qyrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">回单标志</font></div>
              </td>
              <td width="32%"> <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">回单施工队</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+hdsgd+"'",hdsgd,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">建议交底日期</font></td>
              <td width="35%"> <%=jyjdrq%> </td>
              <td width="15%" align="right"><font color="#0000CC">工程进度</font></td>
              <td width="35%"><%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm where gcjdbm='"+gcjdbm+"'",gcjdbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">合同开工日期</font></div>
              </td>
              <td width="35%"> <%=kgrq%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">合同竣工日期</font></div>
              </td>
              <td width="35%"> <%=jgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="15%" align="right"><font color="#0000CC">施工队</font></td>
              <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc||'（'||dwdh||'）' from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="15%" align="right"><font color="#0000CC">关系客户</font></td>
              <td width="35%"> <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm where khlxbm='"+khlxbm+"'",khlxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">计划编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jhbh" value="<%=jhbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">巡检类型</div>
              </td>
              <td width="35%"> 
                <select name="xjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">常规巡检</option>
                  <option value="2">临时巡检</option>
                  <option value="9">其它</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">巡检人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xjr" value="<%=lrzjxm%>" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">计划巡检时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jhxjsj" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
              </td>
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
	if(	javaTrim(FormName.jhbh)=="") {
		alert("请输入[计划编号]！");
		FormName.jhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xjr)=="") {
		alert("请输入[巡检人]！");
		FormName.xjr.focus();
		return false;
	}
	if(	javaTrim(FormName.jhxjsj)=="") {
		alert("请输入[计划巡检时间]！");
		FormName.jhxjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhxjsj, "计划巡检时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xjlx)=="") {
		alert("请选择[巡检类型]！");
		FormName.xjlx.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
