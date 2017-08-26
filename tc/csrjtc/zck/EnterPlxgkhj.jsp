<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>批量修改客户销售单价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String wheresql="";
	String tc_csrjzck_cpbm=null;
	String tc_csrjzck_dqbm=null;
	String tc_csrjzck_bjjbbm=null;
	String tc_csrjzck_nbbm=null;
	String tc_csrjzck_tccpdlbm=null;
	String tc_csrjzck_tccplbbm=null;
	String tc_csrjzck_cpmc=null;
	String tc_csrjzck_xh=null;
	String tc_csrjzck_gg=null;
	String tc_csrjzck_ppmc=null;
	String tc_csrjzck_gysmc=null;
	String tc_csrjzck_jldw=null;
	String tc_csrjzck_xdjldw=null;
	String tc_csrjzck_xdb=null;
	String tc_csrjzck_sh=null;
	String tc_csrjzck_sfxclxs=null;
	String tc_csrjzck_jsj=null;
	String tc_csrjzck_khxsdj=null;
	String tc_csrjzck_sgddj=null;
	String tc_csrjzck_lrr=null;
	String tc_csrjzck_lrsj=null;

	String bzmc=null;
	bzmc=request.getParameter("bzmc");
	if (bzmc!=null)
	{
		bzmc=cf.GB2Uni(bzmc);
		if (!(bzmc.equals("")))	wheresql+=" and  (tc_csrjzck.bzmc='"+bzmc+"')";
	}
	
	
	tc_csrjzck_cpbm=request.getParameter("tc_csrjzck_cpbm");
	if (tc_csrjzck_cpbm!=null)
	{
		tc_csrjzck_cpbm=cf.GB2Uni(tc_csrjzck_cpbm);
		if (!(tc_csrjzck_cpbm.equals("")))	wheresql+=" and  (tc_csrjzck.cpbm='"+tc_csrjzck_cpbm+"')";
	}
	tc_csrjzck_dqbm=request.getParameter("tc_csrjzck_dqbm");
	if (tc_csrjzck_dqbm!=null)
	{
		tc_csrjzck_dqbm=cf.GB2Uni(tc_csrjzck_dqbm);
		if (!(tc_csrjzck_dqbm.equals("")))	wheresql+=" and  (tc_csrjzck.dqbm='"+tc_csrjzck_dqbm+"')";
	}
	tc_csrjzck_bjjbbm=request.getParameter("tc_csrjzck_bjjbbm");
	if (tc_csrjzck_bjjbbm!=null)
	{
		tc_csrjzck_bjjbbm=cf.GB2Uni(tc_csrjzck_bjjbbm);
		if (!(tc_csrjzck_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjzck.bjjbbm='"+tc_csrjzck_bjjbbm+"')";
	}
	tc_csrjzck_nbbm=request.getParameter("tc_csrjzck_nbbm");
	if (tc_csrjzck_nbbm!=null)
	{
		tc_csrjzck_nbbm=cf.GB2Uni(tc_csrjzck_nbbm);
		if (!(tc_csrjzck_nbbm.equals("")))	wheresql+=" and  (tc_csrjzck.nbbm='"+tc_csrjzck_nbbm+"')";
	}
	tc_csrjzck_tccpdlbm=request.getParameter("tc_csrjzck_tccpdlbm");
	if (tc_csrjzck_tccpdlbm!=null)
	{
		tc_csrjzck_tccpdlbm=cf.GB2Uni(tc_csrjzck_tccpdlbm);
		if (!(tc_csrjzck_tccpdlbm.equals("")))	wheresql+=" and (tc_csrjzck.tccpdlbm='"+tc_csrjzck_tccpdlbm+"') ";
	}
	tc_csrjzck_tccplbbm=request.getParameter("tc_csrjzck_tccplbbm");
	if (tc_csrjzck_tccplbbm!=null)
	{
		tc_csrjzck_tccplbbm=cf.GB2Uni(tc_csrjzck_tccplbbm);
		if (!(tc_csrjzck_tccplbbm.equals("")))	wheresql+=" and (tc_csrjzck.tccplbbm='"+tc_csrjzck_tccplbbm+"') ";
	}
	tc_csrjzck_cpmc=request.getParameter("tc_csrjzck_cpmc");
	if (tc_csrjzck_cpmc!=null)
	{
		tc_csrjzck_cpmc=cf.GB2Uni(tc_csrjzck_cpmc);
		if (!(tc_csrjzck_cpmc.equals("")))	wheresql+=" and  (tc_csrjzck.cpmc='"+tc_csrjzck_cpmc+"')";
	}
	tc_csrjzck_xh=request.getParameter("tc_csrjzck_xh");
	if (tc_csrjzck_xh!=null)
	{
		tc_csrjzck_xh=cf.GB2Uni(tc_csrjzck_xh);
		if (!(tc_csrjzck_xh.equals("")))	wheresql+=" and  (tc_csrjzck.xh='"+tc_csrjzck_xh+"')";
	}
	tc_csrjzck_gg=request.getParameter("tc_csrjzck_gg");
	if (tc_csrjzck_gg!=null)
	{
		tc_csrjzck_gg=cf.GB2Uni(tc_csrjzck_gg);
		if (!(tc_csrjzck_gg.equals("")))	wheresql+=" and  (tc_csrjzck.gg='"+tc_csrjzck_gg+"')";
	}
	tc_csrjzck_ppmc=request.getParameter("tc_csrjzck_ppmc");
	if (tc_csrjzck_ppmc!=null)
	{
		tc_csrjzck_ppmc=cf.GB2Uni(tc_csrjzck_ppmc);
		if (!(tc_csrjzck_ppmc.equals("")))	wheresql+=" and  (tc_csrjzck.ppmc='"+tc_csrjzck_ppmc+"')";
	}
	tc_csrjzck_gysmc=request.getParameter("tc_csrjzck_gysmc");
	if (tc_csrjzck_gysmc!=null)
	{
		tc_csrjzck_gysmc=cf.GB2Uni(tc_csrjzck_gysmc);
		if (!(tc_csrjzck_gysmc.equals("")))	wheresql+=" and  (tc_csrjzck.gysmc='"+tc_csrjzck_gysmc+"')";
	}
	tc_csrjzck_jldw=request.getParameter("tc_csrjzck_jldw");
	if (tc_csrjzck_jldw!=null)
	{
		tc_csrjzck_jldw=cf.GB2Uni(tc_csrjzck_jldw);
		if (!(tc_csrjzck_jldw.equals("")))	wheresql+=" and  (tc_csrjzck.jldw='"+tc_csrjzck_jldw+"')";
	}
	tc_csrjzck_xdjldw=request.getParameter("tc_csrjzck_xdjldw");
	if (tc_csrjzck_xdjldw!=null)
	{
		tc_csrjzck_xdjldw=cf.GB2Uni(tc_csrjzck_xdjldw);
		if (!(tc_csrjzck_xdjldw.equals("")))	wheresql+=" and  (tc_csrjzck.xdjldw='"+tc_csrjzck_xdjldw+"')";
	}
	tc_csrjzck_xdb=request.getParameter("tc_csrjzck_xdb");
	if (tc_csrjzck_xdb!=null)
	{
		tc_csrjzck_xdb=tc_csrjzck_xdb.trim();
		if (!(tc_csrjzck_xdb.equals("")))	wheresql+=" and  (tc_csrjzck.xdb="+tc_csrjzck_xdb+") ";
	}
	tc_csrjzck_sh=request.getParameter("tc_csrjzck_sh");
	if (tc_csrjzck_sh!=null)
	{
		tc_csrjzck_sh=tc_csrjzck_sh.trim();
		if (!(tc_csrjzck_sh.equals("")))	wheresql+=" and  (tc_csrjzck.sh="+tc_csrjzck_sh+") ";
	}
	tc_csrjzck_sfxclxs=request.getParameter("tc_csrjzck_sfxclxs");
	if (tc_csrjzck_sfxclxs!=null)
	{
		tc_csrjzck_sfxclxs=cf.GB2Uni(tc_csrjzck_sfxclxs);
		if (!(tc_csrjzck_sfxclxs.equals("")))	wheresql+=" and  (tc_csrjzck.sfxclxs='"+tc_csrjzck_sfxclxs+"')";
	}
	tc_csrjzck_jsj=request.getParameter("tc_csrjzck_jsj");
	if (tc_csrjzck_jsj!=null)
	{
		tc_csrjzck_jsj=tc_csrjzck_jsj.trim();
		if (!(tc_csrjzck_jsj.equals("")))	wheresql+=" and  (tc_csrjzck.jsj="+tc_csrjzck_jsj+") ";
	}
	tc_csrjzck_khxsdj=request.getParameter("tc_csrjzck_khxsdj");
	if (tc_csrjzck_khxsdj!=null)
	{
		tc_csrjzck_khxsdj=tc_csrjzck_khxsdj.trim();
		if (!(tc_csrjzck_khxsdj.equals("")))	wheresql+=" and  (tc_csrjzck.khxsdj="+tc_csrjzck_khxsdj+") ";
	}
	tc_csrjzck_sgddj=request.getParameter("tc_csrjzck_sgddj");
	if (tc_csrjzck_sgddj!=null)
	{
		tc_csrjzck_sgddj=tc_csrjzck_sgddj.trim();
		if (!(tc_csrjzck_sgddj.equals("")))	wheresql+=" and  (tc_csrjzck.sgddj="+tc_csrjzck_sgddj+") ";
	}
	tc_csrjzck_lrr=request.getParameter("tc_csrjzck_lrr");
	if (tc_csrjzck_lrr!=null)
	{
		tc_csrjzck_lrr=cf.GB2Uni(tc_csrjzck_lrr);
		if (!(tc_csrjzck_lrr.equals("")))	wheresql+=" and  (tc_csrjzck.lrr='"+tc_csrjzck_lrr+"')";
	}
	tc_csrjzck_lrsj=request.getParameter("tc_csrjzck_lrsj");
	if (tc_csrjzck_lrsj!=null)
	{
		tc_csrjzck_lrsj=tc_csrjzck_lrsj.trim();
		if (!(tc_csrjzck_lrsj.equals("")))	wheresql+="  and (tc_csrjzck.lrsj=TO_DATE('"+tc_csrjzck_lrsj+"','YYYY/MM/DD'))";
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><strong> 批量修改客户销售单价</strong></div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td width="81%" colspan="3"> 
                <input type="radio" name="jgqz" value="Y">
                结果取整 
                <input type="radio" name="jgqz" value="N">
                结果不取整 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td colspan="3"> 
                <p>客户销售单价＝原客户销售单价×系数
                  <input name="xs" type="text" size="10" maxlength="10">
                </p>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="wheresql" value="<%=wheresql%>"  >              
                <input type="button" name="Button" value="开始修改" onClick="plxg(selectform)" >              
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
function plxg(FormName,lx)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.jgqz)) {
		alert("请选择[结果取整]！");
		FormName.jgqz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.xs)=="") {
		alert("请输入[系数]！");
		FormName.xs.focus();
		return false;
	}
	if(!(isFloat(FormName.xs, "系数"))) {
		return false;
	}


	if (!confirm("确实要修改吗?") )	
	{
		return;
	}

	FormName.action="SaveEnterPlxgkhj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
