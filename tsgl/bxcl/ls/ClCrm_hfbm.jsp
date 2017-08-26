<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhdlm=(String)session.getAttribute("yhdlm");
	String clqk=null;
	String dwmc=null;
	String clsj=null;
	String clr=null;

String crm_tsjl_tsjlh=null;
String dm_tslxbm_tslxmc=null;
String dm_slfsbm_slfsmc=null;
String dm_tsyybm_tsyymc=null;
String crm_tsjl_hth=null;
String crm_tsjl_khbh=null;
String crm_tsjl_khxm=null;
String crm_tsjl_fwdz=null;
String crm_tsjl_lxfs=null;
String crm_tsjl_sjs=null;
String crm_tsjl_sgd=null;
String crm_tsjl_zjy=null;
String crm_tsjl_sjjgrq=null;
String crm_tsjl_sfxhf=null;
String crm_tsjl_hfsj=null;
String crm_tsjl_slsj=null;
String crm_tsjl_slr=null;
String crm_tsjl_clzt=null;
String crm_tsjl_tsnr=null;
String crm_tsjl_yqjjsj=null;
String crm_tsjl_hfjlh=null;
String crm_tsjl_hfjgbm=null;
String crm_tsjl_zxhfsj=null;
String crm_tsjl_hfr=null;
String crm_tsjl_jsxbm=null;
String crm_tsjl_jasj=null;
String crm_tsjl_wxsgd=null;
String crm_tsjl_sqfy=null;
String crm_tsjl_sjcb=null;
String dm_zzjgbm_zzjgmc=null;
String yzcdmc=null;
String sffpsgd=null;
String bz=null;
String tsjlh=null;
String clzt=null;
String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String cldwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select tsjlh";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
	}
	rs.close();

	ls_sql="select DECODE(sffpsgd,'Y','已分配','N','未分配') as sffpsgd,bz,crm_tsjl.tsjlh as crm_tsjl_tsjlh,dm_tslxbm.tslxmc as dm_tslxbm_tslxmc,dm_slfsbm.slfsmc as dm_slfsbm_slfsmc,dm_tsyybm.tsyymc as dm_tsyybm_tsyymc,crm_tsjl.hth as crm_tsjl_hth,crm_tsjl.khbh as crm_tsjl_khbh,crm_tsjl.khxm as crm_tsjl_khxm,crm_tsjl.fwdz as crm_tsjl_fwdz,crm_tsjl.lxfs as crm_tsjl_lxfs,crm_tsjl.sjs as crm_tsjl_sjs,crm_tsjl.sgd as crm_tsjl_sgd,crm_tsjl.zjy as crm_tsjl_zjy,crm_tsjl.sjjgrq as crm_tsjl_sjjgrq,crm_tsjl.sfxhf as crm_tsjl_sfxhf,crm_tsjl.hfsj as crm_tsjl_hfsj,crm_tsjl.slsj as crm_tsjl_slsj,crm_tsjl.slr as crm_tsjl_slr,crm_tsjl.clzt as crm_tsjl_clzt,crm_tsjl.tsnr as crm_tsjl_tsnr,crm_tsjl.yqjjsj as crm_tsjl_yqjjsj,crm_tsjl.hfjlh as crm_tsjl_hfjlh,crm_tsjl.hfjgbm as crm_tsjl_hfjgbm,crm_tsjl.zxhfsj as crm_tsjl_zxhfsj,crm_tsjl.hfr as crm_tsjl_hfr,crm_tsjl.jsxbm as crm_tsjl_jsxbm,crm_tsjl.jasj as crm_tsjl_jasj,crm_tsjl.wxsgd as crm_tsjl_wxsgd,crm_tsjl.sqfy as crm_tsjl_sqfy,crm_tsjl.sjcb as crm_tsjl_sjcb,dm_zzjgbm.zzjgmc as dm_zzjgbm_zzjgmc ";
	ls_sql+=" from  crm_tsjl,dm_slfsbm,dm_tslxbm,dm_tsyybm,dm_zzjgbm";
	ls_sql+=" where crm_tsjl.zzjgbm=dm_zzjgbm.zzjgbm(+) and crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm and  (crm_tsjl.tsjlh="+tsjlh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sffpsgd=cf.fillNull(rs.getString("sffpsgd"));
		bz=cf.fillNull(rs.getString("bz"));
		crm_tsjl_tsjlh=cf.fillNull(rs.getString("crm_tsjl_tsjlh"));
		dm_tslxbm_tslxmc=cf.fillNull(rs.getString("dm_tslxbm_tslxmc"));
		dm_slfsbm_slfsmc=cf.fillNull(rs.getString("dm_slfsbm_slfsmc"));
		dm_tsyybm_tsyymc=cf.fillNull(rs.getString("dm_tsyybm_tsyymc"));
		crm_tsjl_hth=cf.fillNull(rs.getString("crm_tsjl_hth"));
		crm_tsjl_khbh=cf.fillNull(rs.getString("crm_tsjl_khbh"));
		crm_tsjl_khxm=cf.fillNull(rs.getString("crm_tsjl_khxm"));
		crm_tsjl_fwdz=cf.fillNull(rs.getString("crm_tsjl_fwdz"));
		crm_tsjl_lxfs=cf.fillNull(rs.getString("crm_tsjl_lxfs"));
		crm_tsjl_sjs=cf.fillNull(rs.getString("crm_tsjl_sjs"));
		crm_tsjl_sgd=cf.fillNull(rs.getString("crm_tsjl_sgd"));
		crm_tsjl_zjy=cf.fillNull(rs.getString("crm_tsjl_zjy"));
		crm_tsjl_sjjgrq=cf.fillNull(rs.getDate("crm_tsjl_sjjgrq"));
		crm_tsjl_sfxhf=cf.fillNull(rs.getString("crm_tsjl_sfxhf"));
		crm_tsjl_hfsj=cf.fillNull(rs.getDate("crm_tsjl_hfsj"));
		crm_tsjl_slsj=cf.fillNull(rs.getString("crm_tsjl_slsj"));
		crm_tsjl_slr=cf.fillNull(rs.getString("crm_tsjl_slr"));
		crm_tsjl_clzt=cf.fillNull(rs.getString("crm_tsjl_clzt"));
		crm_tsjl_tsnr=cf.fillNull(rs.getString("crm_tsjl_tsnr"));
		crm_tsjl_yqjjsj=cf.fillNull(rs.getDate("crm_tsjl_yqjjsj"));
		crm_tsjl_hfjlh=cf.fillNull(rs.getString("crm_tsjl_hfjlh"));
		crm_tsjl_hfjgbm=cf.fillNull(rs.getString("crm_tsjl_hfjgbm"));
		crm_tsjl_zxhfsj=cf.fillNull(rs.getDate("crm_tsjl_zxhfsj"));
		crm_tsjl_hfr=cf.fillNull(rs.getString("crm_tsjl_hfr"));
		crm_tsjl_jsxbm=cf.fillNull(rs.getString("crm_tsjl_jsxbm"));
		crm_tsjl_jasj=cf.fillNull(rs.getDate("crm_tsjl_jasj"));
		crm_tsjl_wxsgd=cf.fillNull(rs.getString("crm_tsjl_wxsgd"));
		crm_tsjl_sqfy=cf.fillNull(rs.getString("crm_tsjl_sqfy"));
		crm_tsjl_sjcb=cf.fillNull(rs.getString("crm_tsjl_sjcb"));
		dm_zzjgbm_zzjgmc=cf.fillNull(rs.getString("dm_zzjgbm_zzjgmc"));
	}
	rs.close();
%>

<html>
<head>
<title>处理报修信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">报修信息 </div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">客户编号</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_khbh%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">客户姓名</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">房屋地址</font></div>
    </td>
    <td width="32%" bgcolor="#FFFFCC"> <%=crm_tsjl_fwdz%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">联系方式</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">设计师</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_sjs%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">施工队</font></div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_tsjl_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">质检员</font></div>
    </td>
    <td width="32%" bgcolor="#FFFFCC"> <%=crm_tsjl_zjy%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">交工日期</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">报修记录号</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_tsjlh%> </td>
    <td width="17%" bgcolor="#FFFFCC"> 
      <div align="right"><font color="#006666">合同号</font></div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"><%=crm_tsjl_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">报修来源</font></div>
    </td>
    <td width="32%"> <%=dm_slfsbm_slfsmc%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">客服受理人</font></div>
    </td>
    <td width="33%"><%=crm_tsjl_slr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">报修大类</font></div>
    </td>
    <td width="32%"><%=dm_tslxbm_tslxmc%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">报修小类</font></div>
    </td>
    <td width="33%"><%=dm_tsyybm_tsyymc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#006666">报修内容</font></td>
    <td colspan="3"><%=crm_tsjl_tsnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">客服受理时间</font></div>
    </td>
    <td width="32%"><%=crm_tsjl_slsj%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">客户要求解决时间</font></div>
    </td>
    <td width="33%"><%=crm_tsjl_yqjjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right"><font color="#006666">结案时间</font></td>
    <td width="32%"><%=crm_tsjl_jasj%></td>
    <td width="17%" align="right"><font color="#006666">解决问题及时性</font></td>
    <td width="33%"><%
	cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm",crm_tsjl_jsxbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">客户满意度</font></div>
    </td>
    <td width="32%"><%=dm_zzjgbm_zzjgmc%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">处理状态</font></div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"0+非客服登记&1+客服受理&2+在处理&3+结案",crm_tsjl_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right"><font color="#006666">是否分配施工队</font></td>
    <td width="32%"><%=sffpsgd%></td>
    <td width="17%" align="right"><font color="#006666">维修施工队</font></td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh",crm_tsjl_wxsgd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">维修收取费用</font></div>
    </td>
    <td width="32%"><%=crm_tsjl_sqfy%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">维修实际成本</font></div>
    </td>
    <td width="33%"><%=crm_tsjl_sjcb%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">是否需回访</font></div>
    </td>
    <td width="32%"><%
	cf.radioToken(out, "Y+需回访&N+不需回访",crm_tsjl_sfxhf,true);
%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">需回访时间</font></div>
    </td>
    <td width="33%"><%=crm_tsjl_hfsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">最新回访记录号</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_hfjlh%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">最新回访结果</font></div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm",crm_tsjl_hfjgbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">最新回访时间</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_zxhfsj%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">最新回访人</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_hfr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"><font color="#006666">备注</font></td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">涉及部门</font></div>
            </td>
            <td width="10%"> 
              <div align="center"><font color="#006666">处理状态</font></div>
            </td>
            <td width="58%"> 
              <div align="center"><font color="#006666">处理情况</font></div>
            </td>
            <td width="12%"> 
              <div align="center"><font color="#006666">处理时间</font></div>
            </td>
            <td width="8%"> 
              <div align="center"><font color="#006666">处理人</font></div>
            </td>
          </tr>
          <%

	ls_sql="select dwmc,clqk,clsj,clr,DECODE(clzt,'0','未通知','1','未处理','2','在处理','3','已解决') clzt";
	ls_sql+=" from  crm_tsclqk,sq_dwxx";
	ls_sql+=" where crm_tsclqk.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		clqk=cf.fillNull(rs.getString("clqk"));
		clsj=cf.fillNull(rs.getString("clsj"));
		clr=cf.fillNull(rs.getString("clr"));
		clzt=cf.fillNull(rs.getString("clzt"));
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center"><%=dwmc%></td>
            <td align="center"><%=clzt%></td>
            <td><%=clqk%></td>
            <td align="center"><%=clsj%></td>
            <td align="center"><%=clr%></td>
          </tr>
          <%
	}
	rs.close();
%> 
        </table>

        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            
    <td width="15%"> 
      <div align="center"><font color="#006666">回访时间</font></div>
            </td>
            
    <td width="59%"> 
      <div align="center"><font color="#006666">客户回访情况</font></div>
            </td>
            <td width="26%"> 
              <div align="center"><font color="#006666">回访中出现的新问题</font></div>
            </td>
          </tr>
          <%
	String khhfqk=null;
	String cxxwt=null;
	String hfsj=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getString("hfsj"));
%> 
          <tr bgcolor="#FFFFFF"> 
			<td align="center" width="15%" ><%=hfsj%></td>
			<td width="59%" ><%=khhfqk%></td>
			<td width="26%" ><%=cxxwt%></td>
          </tr>
          <%
	}
	rs.close();


%>
        </table>


<%
	ls_sql="select clqk,clr,clsj";
	ls_sql+=" from  crm_tsclqk";
	ls_sql+=" where tsjlh='"+tsjlh+"' and dwbh='"+dwbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		clqk=cf.fillNull(rs.getString("clqk"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));
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
<form method="post" action="SaveCrm_hfbm.jsp" name="editform">
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="4" height="36"> 
        <div align="center"><b>（<%=cldwmc%>）处理报修回访反馈问题</b></div>
      </td>
    </tr>
    <tr> 
      <td width="18%" align="right">处理状态</td>
      <td width="32%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决","");
%> 
        </select>
      </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="18%" align="right">处理人</td>
      <td width="32%"> 
        <input type="text" name="clr" value="<%=clr%>" size="20" maxlength="20" >
        <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
        <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
        <input type="hidden" name="dwbh" value="<%=dwbh%>" >
      </td>
      <td width="17%" align="right">处理时间</td>
      <td width="33%"> 
        <input type="text" name="clsj" value="<%=clsj%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr> 
      <td width="18%" align="right">录入人</td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
      </td>
      <td width="17%" align="right">录入时间</td>
      <td width="33%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr> 
      <td width="18%" align="right">处理情况</td>
      <td colspan="3"> 
        <textarea name="clqk" cols="72" rows="5"><%=clqk%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"> 
          <input type="button"  value="存盘" onClick="f_do(editform)" name="button">
          <input type="reset"  value="重输" name="reset">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clzt)=="") {
		alert("请选择[处理状态]！");
		FormName.clzt.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("请输入[处理人]！");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("请输入[处理时间]！");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "处理时间"))) {
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

	if(	javaTrim(FormName.clqk)=="") {
		alert("请选择[处理情况]！");
		FormName.clqk.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
