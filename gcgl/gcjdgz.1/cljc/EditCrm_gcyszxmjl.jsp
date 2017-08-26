<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String gcyszxmbm=null;
String gcjdbm=null;
String yssj=null;
String ysr=null;
String lrr=null;
String lrsj=null;
String lrdw=null;
String bz=null;
String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,gcyszxmbm,gcjdbm,yssj,ysr,lrr,lrsj,lrdw,bz ";
	ls_sql+=" from  crm_gcyszxmjl";
	ls_sql+=" where  (ysjlh='"+ysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		gcyszxmbm=cf.fillNull(rs.getString("gcyszxmbm"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">材料进场维护（验收记录号：<%=ysjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> <%=khxm%>（<%=lxfs%>） </td>
              <td width="17%"> 
                <div align="right">合同号</div>
              </td>
              <td width="33%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">房屋地址</td>
              <td width="31%"><%=fwdz%></td>
              <td width="17%" align="right">工程担当</td>
              <td width="33%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="17%"> 
                <div align="right">设计师</div>
              </td>
              <td width="33%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">签约日期</div>
              </td>
              <td width="31%"><%=qyrq%> </td>
              <td width="17%"> 
                <div align="right">工程签约额</div>
              </td>
              <td width="33%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="17%"> 
                <div align="right">班长</div>
              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">合同开工日期</td>
              <td width="31%"><font color="#000000"><%=kgrq%></font></td>
              <td width="17%" align="right">合同竣工日期</td>
              <td width="33%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">实际开工日期</td>
              <td width="31%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="17%" align="right">实际竣工日期</td>
              <td width="33%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">验收子项目</div>
              </td>
              <td width="31%"> 
                <select name="gcyszxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='"+gcjdbm+"' order by gcjdbm,gcyszxmbm",gcyszxmbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">验收分类</div>
              </td>
              <td width="33%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"2+材料进场&3+隐蔽工程验收&4+中期验收&5+完工验收",gcjdbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">验收时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yssj" size="20" maxlength="10"  value="<%=yssj%>" >
              </td>
              <td width="17%"> 
                <div align="right">验收人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ysr" size="20" maxlength="20"  value="<%=ysr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right">录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入单位</div>
              </td>
              <td width="31%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="4"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
				<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button"  value="录入材料明细" onClick="f_lrcl(editform)" name="lrcl" >
                  <input type="button"  value="查看材料明细" onClick="f_ckcl(editform)" name="ckcl" >
                  <input type="button"  value="上传照片" onClick="f_lr(editform)" name="lr" >
                  <input type="button"  value="查看照片" onClick="f_ck(editform)" name="ck" >
                  <input type="button"  value="录入施工队处罚" onClick="f_lrcf(editform)" name="lrcf" >
                  <input type="reset"  value="重输">
                </div>
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
	if(	javaTrim(FormName.gcyszxmbm)=="") {
		alert("请选择[验收子项目]！");
		FormName.gcyszxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("请选择[验收分类]！");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("请输入[验收时间]！");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "验收时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("请输入[验收人]！");
		FormName.ysr.focus();
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}

	FormName.action="SaveEditCrm_gcyszxmjl.jsp";
	FormName.submit();
	return true;
}
function f_lrcl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="InsertCrm_cljcmx.jsp";
	FormName.submit();
	return true;
}

function f_ckcl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="Crm_cljcmxList.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_lrcf(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="/gcgl/zjygl/xjgd/InsertKp_xjgdjl.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
