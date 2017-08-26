<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String kgrq=null;
String dwbh=null;
String lrsj=null;
String pdsj=null;
String pdr=null;
String sgd=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String hdbz=null;
String khlxbm=null;
String pmjj=null;
String qye=null;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;

String cgdz=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));

String ykhlxsj=null;
String jslxfs=null;
String lxsm=null;
String xmzy=null;


String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select xmzy,ykhlxsj,jslxfs,lxsm,jlbz,zjxm,pdsm,cgdz,sjs,cqbm,sgbz,pmjj,qye,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,kgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjssmc,ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzy=cf.fillNull(rs.getString("xmzy"));
		ykhlxsj=cf.fillNull(rs.getDate("ykhlxsj"));
		jslxfs=cf.fillNull(rs.getString("jslxfs"));
		lxsm=cf.fillNull(rs.getString("lxsm"));

		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=cf.fillNull(rs.getString("qye"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		ybjssmc=cf.fillNull(rs.getString("ybjssmc"));
		hdsfssmc=cf.fillNull(rs.getString("hdsfssmc"));
	}
	rs.close();

	if (ykhlxsj.equals(""))
	{
		ykhlxsj=cf.today();
	}



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
<title>项目专员与客户联系</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">项目专员与客户联系</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">客户类型</font></div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">联系方式</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=lxfs%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">城区</font></td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"> </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">设计师</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"><%=sjs%> 
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">应开工日期</font></div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"> <%=kgrq%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">回单标志</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%> </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">录入时间</font></div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"> <%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">签约额</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=qye%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">每平米均价</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=pmjj%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">项目专员</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="xmzy" size="20" maxlength="20"  value="<%=xmzy%>" readonly>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">与客户联系时间</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="ykhlxsj" size="20" maxlength="10"  value="<%=ykhlxsj%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">客户接受联系方式</div>
              </td>
              <td colspan="3" bgcolor="#FFFFCC"> <%
	cf.radioToken(out, "jslxfs","1+电话联系&2+发短信&3+不受限制",jslxfs);
%> </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">联系说明</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="lxsm" cols="69" rows="3"><%=lxsm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("请输入[项目专员]！");
		FormName.xmzy.focus();
		return false;
	}
	if(	javaTrim(FormName.ykhlxsj)=="") {
		alert("请输入[与客户联系时间]！");
		FormName.ykhlxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ykhlxsj, "与客户联系时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.jslxfs)) {
		alert("请选择[客户接受联系方式]！");
		FormName.jslxfs[0].focus();
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.target="";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
