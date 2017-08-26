<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;
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
double sjf=0;
double glf=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;
String khlxmc=null;
String sgdmc=null;
String gj=null;
String dd=null;

String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;
String qtsjs="";
String khjl=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khjl,khlxmc,crm_khxx.sgd,sgdmc,gj,dd,crm_khxx.fgsbh,DECODE(jzbz,'1','家装工程','2','公装工程') jzbz,DECODE(NVL(kgzbz,'N'),'Y','已出开工证','N','未出开工证') kgzbz,hth,crm_khxx.jlbz,crm_khxx.zjxm,crm_khxx.pdsm,cgdz,hdr,sjs,cqbm,crm_khxx.sgbz,pmjj,crm_khxx.qye,sjf,glf,ybjbh,crm_khxx.khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,crm_khxx.dwbh,lrsj,crm_khxx.pdsj,crm_khxx.pdr,sfxhf,hfrq,hflxbm,hdbz,crm_khxx.khlxbm,crm_khxx.bz,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjssmc,ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfssmc,hdsfss  ";
	ls_sql+=" from  crm_khxx,dm_khlxbm,sq_sgd ";
	ls_sql+=" where crm_khxx.khbh='"+wherekhbh+"'";
	ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) ";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		khlxmc=cf.fillNull(rs.getString("khlxmc"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));

		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
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
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
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
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtsjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<html>
<head>
<title>派调度</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">派调度</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#0000CC">客户编号</font>              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%></font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099"> 
              合同号              </font></td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">店面</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000">
              <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>
              </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">每平米均价</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=pmjj%> 
                </font></td>
            </tr>
            
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">设计师</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=sjs%><%=qtsjs%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">客户经理</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=khjl%></font></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">施工队</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=sgdmc%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">班长</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=sgbz%></font></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">质检</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=zjxm%></font></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">调度</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=gj%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">调度</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=dd%></font></td>
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
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><font color="#000000"><b>是否家装</b></font></td>
              <td width="31%"><font color="#000000"><b><%=jzbz%></b></font></td>
              <td width="18%" align="right"><font color="#000000"><b>合同签约额</b></font></td>
              <td width="32%" bgcolor="#FFCCCC"><font color="#000000"><b><%=qye%></b></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b>设计费</b></td>
              <td width="31%"><font color="#000000"><b><%=sjf%></b></font></td>
              <td width="18%" align="right"><b>服务费</b></td>
              <td width="32%"><font color="#000000"><b><%=glf%></b></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b><font color="#0000FF">客户类型</font></b></td>
              <td width="31%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="18%" align="right"><b>建议交底日期</b></td>
              <td width="32%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b>合同开工日期</b></td>
              <td width="31%"><font color="#000000"><%=kgrq%></font></td>
              <td width="18%" align="right"><b>合同竣工日期</b></td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
			  <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">调度</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="dd" style="FONT-SIZE:12PX;WIDTH:180PX">
                 <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='07' and sfzszg in('Y','N') order by yhmc",dd);
%> 
                </select>              </td>
              <td width="18%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="32%" bgcolor="#FFFFCC">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
				<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="button"  value="保存" onClick="f_do(editform)">            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.dd)=="") {
		alert("请选择[调度]");
		FormName.dd.focus();
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

