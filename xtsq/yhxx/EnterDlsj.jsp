<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

	String wheresql="";
	String sq_yhxx_yhdlm=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_yhkl=null;
	String sq_yhxx_yhjs=null;
	String dwbh=null;
	String sq_yhxx_xb=null;
	String sq_yhxx_csrq=null;
	String sq_yhxx_dh=null;
	String sq_yhxx_email=null;
	String sq_yhxx_zz=null;

	String ckjgbz=null;
	String zwbm=null;
	String zkl=null;
	String zdyhbz=null;

	String kfgssq=request.getParameter("kfgssq");
	if (kfgssq!=null)
	{
		kfgssq=cf.GB2Uni(kfgssq);
		if (!(kfgssq.equals("")))	wheresql+=" and  (sq_yhxx.kfgssq='"+kfgssq+"')";
	}

	String kkglfx=request.getParameter("kkglfx");
	if (kkglfx!=null)
	{
		kkglfx=cf.GB2Uni(kkglfx);
		if (!(kkglfx.equals("")))	wheresql+=" and  (sq_yhxx.kkglfx='"+kkglfx+"')";
	}

	String khdhbz=request.getParameter("khdhbz");
	if (khdhbz!=null)
	{
		khdhbz=cf.GB2Uni(khdhbz);
		if (!(khdhbz.equals("")))	wheresql+=" and  (sq_yhxx.khdhbz='"+khdhbz+"')";
	}

	String sjxzbz=request.getParameter("sjxzbz");
	if (sjxzbz!=null)
	{
		sjxzbz=cf.GB2Uni(sjxzbz);
		if (!(sjxzbz.equals("")))	wheresql+=" and  (sq_yhxx.sjxzbz='"+sjxzbz+"')";
	}

	String sbsj=request.getParameter("sbsj");
	if (sbsj!=null)
	{
		sbsj=cf.GB2Uni(sbsj);
		if (!(sbsj.equals("")))	wheresql+=" and  (sq_yhxx.sbsj='"+sbsj+"')";
	}

	String xbsj=request.getParameter("xbsj");
	if (xbsj!=null)
	{
		xbsj=cf.GB2Uni(xbsj);
		if (!(xbsj.equals("")))	wheresql+=" and  (sq_yhxx.xbsj='"+xbsj+"')";
	}

	String ipxzbz=request.getParameter("ipxzbz");
	if (ipxzbz!=null)
	{
		ipxzbz=cf.GB2Uni(ipxzbz);
		if (!(ipxzbz.equals("")))	wheresql+=" and  (sq_yhxx.ipxzbz='"+ipxzbz+"')";
	}

	String ipdz=request.getParameter("ipdz");
	if (ipdz!=null)
	{
		ipdz=cf.GB2Uni(ipdz);
		if (!(ipdz.equals("")))	wheresql+=" and  (sq_yhxx.ipdz like '%"+ipdz+"%')";
	}

	String wkxzbz=request.getParameter("wkxzbz");
	if (wkxzbz!=null)
	{
		wkxzbz=cf.GB2Uni(wkxzbz);
		if (!(wkxzbz.equals("")))	wheresql+=" and  (sq_yhxx.wkxzbz='"+wkxzbz+"')";
	}

	String wkdz=request.getParameter("wkdz");
	if (wkdz!=null)
	{
		wkdz=cf.GB2Uni(wkdz);
		if (!(wkdz.equals("")))	wheresql+=" and  (sq_yhxx.wkdz like '%"+wkdz+"%')";
	}

	String[] bjjbbm=request.getParameterValues("bjjbbm");
	if (bjjbbm!=null)
	{
		String bjjb="";
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			String bjjbmc=null;

			if (bjjbbm[i].equals(""))
			{
				continue;
			}
			
			bjjbmc=cf.executeQuery("select bjjbmc from  bdm_bjjbbm where bjjbbm='"+bjjbbm[i]+"'");
			bjjb+="、"+bjjbmc;
		}
		if (!bjjb.equals(""))
		{
			bjjb=bjjb.substring(1);
			wheresql+=" and  (sq_yhxx.bjjb='"+bjjb+"')";
		}
	}

	String[] bjjbbm1=request.getParameterValues("bjjbbm1");
	if (bjjbbm1!=null)
	{
		wheresql+=" and  (sq_yhxx.ygbh in(select ygbh from sq_sjsbjjb where "+cf.arrayToInSQL(bjjbbm1,"sq_sjsbjjb.bjjbbm")+"))";
	}

	String xzzwbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	String kkbbz=null;
	kkbbz=request.getParameter("kkbbz");
	if (kkbbz!=null)
	{
		if (kkbbz.equals("Y"))
		{
			wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"')";
		}
		else{
			wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"' OR sq_yhxx.kkbbz is null)";
		}
	}
	
	
	String yhzbh=null;
	yhzbh=request.getParameter("yhzbh");
	if (yhzbh!=null)
	{
		if (!(yhzbh.equals("")))	wheresql+=" and  (sq_yhxx.yhdlm in(select yhdlm from sq_yhssz where yhzbh='"+yhzbh+"'))";
	}

	String sfsq=null;
	sfsq=request.getParameter("sfsq");
	if (sfsq!=null)
	{
		if (sfsq.equals("Y"))
		{
			wheresql+=" and  (sq_yhxx.yhdlm in(select yhdlm from sq_yhssz))";
		}
		else if (sfsq.equals("N"))
		{
			wheresql+=" and  (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz) or sq_yhxx.yhdlm is null)";
		}
	}
	
	String ygbh=null;
	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		if (!(ygbh.equals("")))	wheresql+=" and  (sq_yhxx.ygbh='"+ygbh+"')";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	
	

	String kdlxtbz=null;
	kdlxtbz=request.getParameter("kdlxtbz");
	if (kdlxtbz!=null)
	{
		if (!(kdlxtbz.equals("")))	wheresql+=" and  (sq_yhxx.kdlxtbz='"+kdlxtbz+"')";
	}
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (sq_yhxx.sjsbh='"+sjsbh+"')";
	}
	zdyhbz=request.getParameter("zdyhbz");
	if (zdyhbz!=null)
	{
		if (!(zdyhbz.equals("")))	wheresql+=" and  (sq_yhxx.zdyhbz='"+zdyhbz+"')";
	}
	ckjgbz=request.getParameter("ckjgbz");
	if (ckjgbz!=null)
	{
		if (!(ckjgbz.equals("")))	wheresql+=" and  (sq_yhxx.ckjgbz='"+ckjgbz+"')";
	}
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		if (!(zwbm.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+zwbm+"')";
	}
	zkl=request.getParameter("zkl");
	if (zkl!=null)
	{
		if (!(zkl.equals("")))	wheresql+=" and  (sq_yhxx.zkl>="+zkl+")";
	}
	zkl=request.getParameter("zkl2");
	if (zkl!=null)
	{
		if (!(zkl.equals("")))	wheresql+=" and  (sq_yhxx.zkl<="+zkl+")";
	}

	sq_yhxx_yhdlm=request.getParameter("sq_yhxx_yhdlm");
	if (sq_yhxx_yhdlm!=null)
	{
		sq_yhxx_yhdlm=cf.GB2Uni(sq_yhxx_yhdlm);
		if (!(sq_yhxx_yhdlm.equals("")))	wheresql+=" and  (sq_yhxx.yhdlm='"+sq_yhxx_yhdlm+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	sq_yhxx_yhkl=request.getParameter("sq_yhxx_yhkl");
	if (sq_yhxx_yhkl!=null)
	{
		sq_yhxx_yhkl=cf.GB2Uni(sq_yhxx_yhkl);
		if (!(sq_yhxx_yhkl.equals("")))	wheresql+=" and  (sq_yhxx.yhkl='"+sq_yhxx_yhkl+"')";
	}
	sq_yhxx_yhjs=request.getParameter("sq_yhxx_yhjs");
	if (sq_yhxx_yhjs!=null)
	{
		sq_yhxx_yhjs=cf.GB2Uni(sq_yhxx_yhjs);
		if (!(sq_yhxx_yhjs.equals("")))	wheresql+=" and  (sq_yhxx.yhjs='"+sq_yhxx_yhjs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}
	sq_yhxx_xb=request.getParameter("sq_yhxx_xb");
	if (sq_yhxx_xb!=null)
	{
		sq_yhxx_xb=cf.GB2Uni(sq_yhxx_xb);
		if (!(sq_yhxx_xb.equals("")))	wheresql+=" and  (sq_yhxx.xb='"+sq_yhxx_xb+"')";
	}
	sq_yhxx_csrq=request.getParameter("sq_yhxx_csrq");
	if (sq_yhxx_csrq!=null)
	{
		sq_yhxx_csrq=sq_yhxx_csrq.trim();
		if (!(sq_yhxx_csrq.equals("")))	wheresql+="  and (sq_yhxx.csrq=TO_DATE('"+sq_yhxx_csrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_dh=request.getParameter("sq_yhxx_dh");
	if (sq_yhxx_dh!=null)
	{
		sq_yhxx_dh=cf.GB2Uni(sq_yhxx_dh);
		if (!(sq_yhxx_dh.equals("")))	wheresql+=" and  (sq_yhxx.dh='"+sq_yhxx_dh+"')";
	}
	sq_yhxx_email=request.getParameter("sq_yhxx_email");
	if (sq_yhxx_email!=null)
	{
		sq_yhxx_email=cf.GB2Uni(sq_yhxx_email);
		if (!(sq_yhxx_email.equals("")))	wheresql+=" and  (sq_yhxx.email='"+sq_yhxx_email+"')";
	}
	sq_yhxx_zz=request.getParameter("sq_yhxx_zz");
	if (sq_yhxx_zz!=null)
	{
		sq_yhxx_zz=cf.GB2Uni(sq_yhxx_zz);
		if (!(sq_yhxx_zz.equals("")))	wheresql+=" and  (sq_yhxx.zz='"+sq_yhxx_zz+"')";
	}

	String ssfgs=request.getParameter("ssfgs");

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
      <div align="center">批量设置－登陆时间</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="37%" align="right"><font color="#FF0000">*</font>密码使用周期</td>
              <td width="63%" colspan="3"><input type="text" name="mmsyzq" size="10" maxlength="16"  value="" >
天 <br>
<b><font color="#0000CC">密码使用超过这个时间强制修改密码</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>允许登陆失败次数</td>
              <td colspan="3"><input type="text" name="yxdlsbcs" size="10" maxlength="16"  value="" >
                <font color="#0000CC"><b>连续登陆失败后锁帐号</b></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>不上系统锁密码周期</td>
              <td colspan="3"><input type="text" name="bsxtsmmzq" size="10" maxlength="16"  value="" >
天 <br>
<font color="#0000CC"><b>超过一定时间不上系统自动锁帐号</b></font></td>
            </tr>
            
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="fgs"  value="<%=ssfgs%>" >
				<input type="hidden" name="wheresql"  value="<%=wheresql%>" >
                  <input type="button"  value="修改" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.mmsyzq)=="") {
		alert("请输入[密码使用周期]！");
		FormName.mmsyzq.focus();
		return false;
	}
	if(!(isInt(FormName.mmsyzq, "密码使用周期"))) {
		return false;
	}
	if(	javaTrim(FormName.yxdlsbcs)=="") {
		alert("请输入[允许登陆失败次数]！");
		FormName.yxdlsbcs.focus();
		return false;
	}
	if(!(isInt(FormName.yxdlsbcs, "允许登陆失败次数"))) {
		return false;
	}
	if(	javaTrim(FormName.bsxtsmmzq)=="") {
		alert("请输入[不上系统锁密码周期]！");
		FormName.bsxtsmmzq.focus();
		return false;
	}
	if(!(isInt(FormName.bsxtsmmzq, "不上系统锁密码周期"))) {
		return false;
	}

	FormName.action="SaveEnterDlsj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
