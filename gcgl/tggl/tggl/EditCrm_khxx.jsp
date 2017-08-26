<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
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
double qye=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;

String cgdz=null;
String hdr=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String ssfgs=null;


Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,sgbz,pmjj,qye,ybjbh,khxm,fwdz,lxfs,qyrq,kgrq,sjkgrq,jgrq,sjjgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjssmc,ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
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
<title>停工管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">停工管理 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#0000CC">客户编号</font>              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                合同号              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>（<%=lxfs%>）</font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">关系客户</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">城区</font></td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"> <%=fwdz%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#0000CC">设计师</font>              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=sjs%> 
                </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#0000CC">签约店面</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#0000CC">签约日期</font>              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">录入时间</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">合同开工日期</font>              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"><%=kgrq%> 
                </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">合同完工日期</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=jgrq%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">实际开工日期</font>              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"><%=sjkgrq%></font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">实际完工日期</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=sjjgrq%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                <font color="#FF0000">*</font>停工开始时间              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="tgkssj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                估计复工日期              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="gjfgsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right"><font color="#FF0000">*</font>停工原因</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="tgyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm order by tgyybm","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="32%" bgcolor="#FFFFCC">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font>停工说明              </td>
              <td colspan="3"> 
                <textarea name="tgsm" cols="71" rows="4"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="khbh"  value="<%=khbh%>" >
                <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tgkssj)=="") {
		alert("请输入[停工开始时间]！");
		FormName.tgkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tgkssj, "停工开始时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.gjfgsj, "估计复工日期"))) {
		return false;
	}
	if(	javaTrim(FormName.tgyybm)=="") {
		alert("请输入[停工原因]！");
		FormName.tgyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tgsm)=="") {
		alert("请输入[停工说明]！");
		FormName.tgsm.focus();
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
