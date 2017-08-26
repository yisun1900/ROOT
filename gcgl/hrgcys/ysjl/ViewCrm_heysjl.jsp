<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ysjlh=null;
String yscsjlh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String gcysbbh=null;
String gcysxmbm=null;
String gcysxmmc=null;
String yszxsl=null;
String yssj=null;
String ysr=null;
String sjysjg=null;
String clbz=null;
String zgcljlh=null;
String jhjjsj=null;
String jsr=null;
String jssj=null;
String jssm=null;
String cljg=null;
String jjr=null;
String jjsj=null;
String jjsm=null;
String zgysjg=null;
String zgysr=null;
String zgyssj=null;
String zgyssm=null;
String sfszhf=null;
String hfszjlh=null;
String gcjdbm=null;
String sfsgjdb=null;
String jdbm=null;
String ygcjdbm=null;
String ysfxhf=null;
String yhfrq=null;
String yhflxbm=null;
String yysjlh=null;
String ygcysxmbm=null;
String yyssj=null;
String zpsl=null;
String khkkzpsl=null;
String lrbm=null;
String lrr=null;
String lrsj=null;
String fdxbz=null;
String xlrmx=null;
String bz=null;
String dwjg=null;
String dwwz=null;
String dwjd=null;
String dwwd=null;
String dwhb=null;
String padlrbz=null;
String whereysjlh=null;
whereysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_heysjl.ysjlh as ysjlh,crm_heysjl.yscsjlh as yscsjlh,crm_heysjl.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_heysjl.sjs as sjs,sgdmc,crm_heysjl.zjxm as zjxm,crm_heysjl.gcysbbh as gcysbbh,crm_heysjl.gcysxmbm as gcysxmbm,crm_heysjl.gcysxmmc as gcysxmmc,crm_heysjl.yszxsl as yszxsl,crm_heysjl.yssj as yssj,crm_heysjl.ysr as ysr,DECODE(crm_heysjl.sjysjg,'0','合格','1','不合格') sjysjg,DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') clbz,crm_heysjl.zgcljlh as zgcljlh,crm_heysjl.jhjjsj as jhjjsj,crm_heysjl.jsr as jsr,crm_heysjl.jssj as jssj,crm_heysjl.jssm as jssm,crm_heysjl.cljg as cljg,crm_heysjl.jjr as jjr,crm_heysjl.jjsj as jjsj,crm_heysjl.jjsm as jjsm,crm_heysjl.zgysjg as zgysjg,crm_heysjl.zgysr as zgysr,crm_heysjl.zgyssj as zgyssj,crm_heysjl.zgyssm as zgyssm,crm_heysjl.sfszhf as sfszhf,crm_heysjl.hfszjlh as hfszjlh,crm_heysjl.gcjdbm as gcjdbm,crm_heysjl.sfsgjdb as sfsgjdb,crm_heysjl.jdbm as jdbm,crm_heysjl.ygcjdbm as ygcjdbm,crm_heysjl.ysfxhf as ysfxhf,crm_heysjl.yhfrq as yhfrq,crm_heysjl.yhflxbm as yhflxbm,crm_heysjl.yysjlh as yysjlh,crm_heysjl.ygcysxmbm as ygcysxmbm,crm_heysjl.yyssj as yyssj,crm_heysjl.zpsl as zpsl,crm_heysjl.khkkzpsl as khkkzpsl,crm_heysjl.lrbm as lrbm,crm_heysjl.lrr as lrr,crm_heysjl.lrsj as lrsj,crm_heysjl.fdxbz as fdxbz,crm_heysjl.xlrmx as xlrmx,crm_heysjl.bz as bz,crm_heysjl.dwjg as dwjg,crm_heysjl.dwwz as dwwz,crm_heysjl.dwjd as dwjd,crm_heysjl.dwwd as dwwd,crm_heysjl.dwhb as dwhb,crm_heysjl.padlrbz as padlrbz ";
	ls_sql+=" from  crm_heysjl,crm_khxx,sq_sgd";
	ls_sql+=" where crm_heysjl.khbh=crm_khxx.khbh(+) and  (crm_heysjl.ysjlh='"+whereysjlh+"')  ";
	ls_sql+=" and crm_heysjl.sgd=sq_sgd.sgd(+) and  (crm_heysjl.ysjlh='"+whereysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysjlh=cf.fillNull(rs.getString("ysjlh"));
		yscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		yszxsl=cf.fillNull(rs.getString("yszxsl"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
		zgcljlh=cf.fillNull(rs.getString("zgcljlh"));
		jhjjsj=cf.fillNull(rs.getDate("jhjjsj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jssm=cf.fillNull(rs.getString("jssm"));
		cljg=cf.fillNull(rs.getString("cljg"));
		jjr=cf.fillNull(rs.getString("jjr"));
		jjsj=cf.fillNull(rs.getDate("jjsj"));
		jjsm=cf.fillNull(rs.getString("jjsm"));
		zgysjg=cf.fillNull(rs.getString("zgysjg"));
		zgysr=cf.fillNull(rs.getString("zgysr"));
		zgyssj=cf.fillNull(rs.getDate("zgyssj"));
		zgyssm=cf.fillNull(rs.getString("zgyssm"));
		sfszhf=cf.fillNull(rs.getString("sfszhf"));
		hfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sfsgjdb=cf.fillNull(rs.getString("sfsgjdb"));
		jdbm=cf.fillNull(rs.getString("jdbm"));
		ygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
		ysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		yhfrq=cf.fillNull(rs.getDate("yhfrq"));
		yhflxbm=cf.fillNull(rs.getString("yhflxbm"));
		yysjlh=cf.fillNull(rs.getString("yysjlh"));
		ygcysxmbm=cf.fillNull(rs.getString("ygcysxmbm"));
		yyssj=cf.fillNull(rs.getDate("yyssj"));
		zpsl=cf.fillNull(rs.getString("zpsl"));
		khkkzpsl=cf.fillNull(rs.getString("khkkzpsl"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fdxbz=cf.fillNull(rs.getString("fdxbz"));
		xlrmx=cf.fillNull(rs.getString("xlrmx"));
		bz=cf.fillNull(rs.getString("bz"));
		dwjg=cf.fillNull(rs.getString("dwjg"));
		dwwz=cf.fillNull(rs.getString("dwwz"));
		dwjd=cf.fillNull(rs.getString("dwjd"));
		dwwd=cf.fillNull(rs.getString("dwwd"));
		dwhb=cf.fillNull(rs.getString("dwhb"));
		padlrbz=cf.fillNull(rs.getString("padlrbz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td  align="center" colspan="4"><input name="ckxm" type="button"  onClick="window.open('ViewCrm_heysmxb.jsp?ysjlh=<%=ysjlh%>')"  value="查看项目" >
    <input name="cktp" type="button" id="cktp" onClick="window.open('ViewZp1.jsp?ysjlh=<%=ysjlh%>')"  value="查看图片" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    验收记录号  </td>
  <td width="32%"> 
    <%=ysjlh%>  </td>
  <td align="right" width="18%"> 
    验收次数记录号  </td>
  <td width="32%"> 
    <%=yscsjlh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户编号  </td>
  <td width="32%"> 
    <%=khbh%>  </td>
  <td align="right" width="18%"> 
    客户姓名  </td>
  <td width="32%"> 
    <%=crm_khxx_khxm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    房屋地址  </td>
  <td width="32%"> 
    <%=crm_khxx_fwdz%>  </td>
  <td align="right" width="18%"> 
    设计师  </td>
  <td width="32%"> 
    <%=sjs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    施工队  </td>
  <td width="32%"> 
    <%=sgd%>  </td>
  <td align="right" width="18%"> 
    质检  </td>
  <td width="32%"> 
    <%=zjxm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    验收版本号  </td>
  <td width="32%"> 
    <%=gcysbbh%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    验收项目名称  </td>
  <td width="32%"> 
    <%=gcysxmmc%>  </td>
  <td align="right" width="18%"> 
    验收子项数量  </td>
  <td width="32%"> 
    <%=yszxsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    项目验收时间  </td>
  <td width="32%"> 
    <%=yssj%>  </td>
  <td align="right" width="18%"> 
    项目验收人  </td>
  <td width="32%"> 
    <%=ysr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    项目验收结果  </td>
  <td width="32%"> 
<%=sjysjg%>  </td>
  <td align="right" width="18%"> 
    整改处理状态  </td>
  <td width="32%"> 
<%=clbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改处理记录号  </td>
  <td width="32%"> 
    <%=zgcljlh%>  </td>
  <td align="right" width="18%"> 
    计划解决时间  </td>
  <td width="32%"> 
    <%=jhjjsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改接收人  </td>
  <td width="32%"> 
    <%=jsr%>  </td>
  <td align="right" width="18%"> 
    整改接收时间  </td>
  <td width="32%"> 
    <%=jssj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改接收说明  </td>
  <td width="32%"> 
    <%=jssm%>  </td>
  <td align="right" width="18%"> 
    处理结果  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "3+在处理&4+已解决",cljg,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改处理人  </td>
  <td width="32%"> 
    <%=jjr%>  </td>
  <td align="right" width="18%"> 
    整改处理时间  </td>
  <td width="32%"> 
    <%=jjsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改处理情况  </td>
  <td width="32%"> 
    <%=jjsm%>  </td>
  <td align="right" width="18%"> 
    整改验收结果  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "5+合格&6+不合格",zgysjg,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改验收人  </td>
  <td width="32%"> 
    <%=zgysr%>  </td>
  <td align="right" width="18%"> 
    整改验收时间  </td>
  <td width="32%"> 
    <%=zgyssj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    整改验收情况  </td>
  <td width="32%"> 
    <%=zgyssm%>  </td>
  <td align="right" width="18%"> 
    是否设置回访  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+是&N+否",sfszhf,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    回访设置记录号  </td>
  <td width="32%"> 
    <%=hfszjlh%>  </td>
  <td align="right" width="18%"> 
    设置工程进度编码  </td>
  <td width="32%"> 
    <%=gcjdbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    是否关联施工进度表  </td>
  <td width="32%"> 
    <%=sfsgjdb%>  </td>
  <td align="right" width="18%"> 
    施工进度进度节点  </td>
  <td width="32%"> 
    <%=jdbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    原工程进度编码  </td>
  <td width="32%"> 
    <%=ygcjdbm%>  </td>
  <td align="right" width="18%"> 
    原是否需回访  </td>
  <td width="32%"> 
    <%=ysfxhf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    原应回访日期  </td>
  <td width="32%"> 
    <%=yhfrq%>  </td>
  <td align="right" width="18%"> 
    原回访类型编码  </td>
  <td width="32%"> 
    <%=yhflxbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    原验收记录号  </td>
  <td width="32%"> 
    <%=yysjlh%>  </td>
  <td align="right" width="18%"> 
    原验收项目编码  </td>
  <td width="32%"> 
    <%=ygcysxmbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    原验收时间  </td>
  <td width="32%"> 
    <%=yyssj%>  </td>
  <td align="right" width="18%"> 
    照片数量  </td>
  <td width="32%"> 
    <%=zpsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户可看照片数量  </td>
  <td width="32%"> 
    <%=khkkzpsl%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    录入人  </td>
  <td width="32%"> 
    <%=lrr%>  </td>
  <td align="right" width="18%"> 
    录入时间  </td>
  <td width="32%"> 
    <%=lrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    发短信标志  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "1+未发送&2+发送",fdxbz,true);
%>  </td>
  <td align="right" width="18%"> 
    需录入明细  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"1+不需录入&2+需录入&3+已录入",xlrmx,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    备注  </td>
  <td width="32%"> 
    <%=bz%>  </td>
  <td align="right" width="18%"> 
    定位结果  </td>
  <td width="32%"> 
    <%=dwjg%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    定位位置  </td>
  <td width="32%"> 
    <%=dwwz%>  </td>
  <td align="right" width="18%"> 
    定位精度  </td>
  <td width="32%"> 
    <%=dwjd%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    定位纬度  </td>
  <td width="32%"> 
    <%=dwwd%>  </td>
  <td align="right" width="18%"> 
    定位海拔  </td>
  <td width="32%"> 
    <%=dwhb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户端录入标志  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "0+电脑&1+客户端",padlrbz,true);
%>  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
</table>
</body>
</html>
