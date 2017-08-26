<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String jc_mmydd_yddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_kgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String jc_mmydd_wjqk=null;
String jc_mmydd_sqdj=null;
String jc_mmydd_clgw=null;
String jc_mmydd_pdgc=null;
String jc_mmydd_mmcljs=null;
String jc_mmydd_jhccsj=null;
String jc_mmydd_sccsj=null;
String jc_mmydd_ccsm=null;
String jc_mmydd_mmhtje=null;
String jc_mmydd_wjhtje=null;
String jc_mmydd_blhtje=null;
String jc_mmydd_htje=null;
String jc_mmydd_htrq=null;
String jc_mmydd_htqdr=null;
String jc_mmydd_htbz=null;
String jc_mmydd_wjsgsbz=null;
String jc_mmydd_swjsj=null;
String jc_mmydd_wjjsr=null;
String jc_mmydd_wjjsqk=null;
String jc_mmydd_srksj=null;
String jc_mmydd_rkr=null;
String jc_mmydd_rksm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sshsj=null;
String jc_mmydd_azkssj=null;
String jc_mmydd_azjssj=null;
String jc_mmydd_mmycyybm=null;
String jc_mmydd_ycsm=null;
String jc_mmydd_zsycyybm=null;
String jc_mmydd_ychsqk=null;
String jc_mmydd_ychsr=null;
String jc_mmydd_ychssj=null;
String jc_mmydd_sfjs=null;
String jc_mmydd_clzt=null;
String jc_mmydd_lrr=null;
String jc_mmydd_lrsj=null;
String sq_dwxx_dwmc=null;
String jc_mmydd_bz=null;
String xmzy=null;

String sgbz=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String lxfs=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String ssfgs=null;
String cxhdbm=null;
String fkje=null;

int count=0;

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.fgsbh,jc_mmydd.xmzy,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.pdgc as jc_mmydd_pdgc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.mmhtje as jc_mmydd_mmhtje,jc_mmydd.wjhtje as jc_mmydd_wjhtje,jc_mmydd.blhtje as jc_mmydd_blhtje,jc_mmydd.htje as jc_mmydd_htje,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		paidr=cf.fillNull(rs.getString("paidr"));
		paidsj=cf.fillNull(rs.getDate("paidsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		lxfs=cf.fillNull(rs.getString("lxfs"));

		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		jc_mmydd_wjqk=cf.fillNull(rs.getString("jc_mmydd_wjqk"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("jc_mmydd_sqdj"));
		jc_mmydd_clgw=cf.fillNull(rs.getString("jc_mmydd_clgw"));
		jc_mmydd_pdgc=cf.fillNull(rs.getString("jc_mmydd_pdgc"));
		jc_mmydd_mmcljs=cf.fillNull(rs.getString("jc_mmydd_mmcljs"));
		jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jc_mmydd_jhccsj"));
		jc_mmydd_sccsj=cf.fillNull(rs.getDate("jc_mmydd_sccsj"));
		jc_mmydd_ccsm=cf.fillNull(rs.getString("jc_mmydd_ccsm"));
		jc_mmydd_mmhtje=cf.fillNull(rs.getString("jc_mmydd_mmhtje"));
		jc_mmydd_wjhtje=cf.fillNull(rs.getString("jc_mmydd_wjhtje"));
		jc_mmydd_blhtje=cf.fillNull(rs.getString("jc_mmydd_blhtje"));
		jc_mmydd_htje=cf.fillNull(rs.getString("jc_mmydd_htje"));
		jc_mmydd_htrq=cf.fillNull(rs.getDate("jc_mmydd_htrq"));
		jc_mmydd_htqdr=cf.fillNull(rs.getString("jc_mmydd_htqdr"));
		jc_mmydd_htbz=cf.fillNull(rs.getString("jc_mmydd_htbz"));
		jc_mmydd_wjsgsbz=cf.fillNull(rs.getString("jc_mmydd_wjsgsbz"));
		jc_mmydd_swjsj=cf.fillNull(rs.getDate("jc_mmydd_swjsj"));
		jc_mmydd_wjjsr=cf.fillNull(rs.getString("jc_mmydd_wjjsr"));
		jc_mmydd_wjjsqk=cf.fillNull(rs.getString("jc_mmydd_wjjsqk"));
		jc_mmydd_srksj=cf.fillNull(rs.getDate("jc_mmydd_srksj"));
		jc_mmydd_rkr=cf.fillNull(rs.getString("jc_mmydd_rkr"));
		jc_mmydd_rksm=cf.fillNull(rs.getString("jc_mmydd_rksm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jc_mmydd_jhazsj"));
		jc_mmydd_sshsj=cf.fillNull(rs.getDate("jc_mmydd_sshsj"));
		jc_mmydd_azkssj=cf.fillNull(rs.getDate("jc_mmydd_azkssj"));
		jc_mmydd_azjssj=cf.fillNull(rs.getDate("jc_mmydd_azjssj"));
		jc_mmydd_mmycyybm=cf.fillNull(rs.getString("jc_mmydd_mmycyybm"));
		jc_mmydd_ycsm=cf.fillNull(rs.getString("jc_mmydd_ycsm"));
		jc_mmydd_zsycyybm=cf.fillNull(rs.getString("jc_mmydd_zsycyybm"));
		jc_mmydd_ychsqk=cf.fillNull(rs.getString("jc_mmydd_ychsqk"));
		jc_mmydd_ychsr=cf.fillNull(rs.getString("jc_mmydd_ychsr"));
		jc_mmydd_ychssj=cf.fillNull(rs.getDate("jc_mmydd_ychssj"));
		jc_mmydd_sfjs=cf.fillNull(rs.getString("jc_mmydd_sfjs"));
		jc_mmydd_clzt=cf.fillNull(rs.getString("jc_mmydd_clzt"));
		jc_mmydd_lrr=cf.fillNull(rs.getString("jc_mmydd_lrr"));
		jc_mmydd_lrsj=cf.fillNull(rs.getDate("jc_mmydd_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jc_mmydd_bz=cf.fillNull(rs.getString("jc_mmydd_bz"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+crm_khxx_dwbh+"' and yhmc ='"+crm_khxx_sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where sq_yhxx.ssfgs='"+ssfgs+"' and yhmc ='"+crm_khxx_zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
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
<title>木门预订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">木门预订单---退单(预订单编号：<%=yddbh%>) 

<%
if (count>0)
{
	%>
	
	<font color="#FF0033"><b>注意！本订单已发生[<%=count%>]笔增减项，系统对增减项会自动退单</b></font> 

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">增减序号</td>
	<td  width="7%">派单工厂</td>
	<td  width="10%">处理状态</td>
	<td  width="8%">客户姓名</td>
	<td  width="12%">增减项原因</td>
	<td  width="9%">增减项总额</td>
	<td  width="9%">增减项发生时间</td>
	<td  width="9%">录入时间</td>
	<td  width="12%">录入部门</td>
	<td  width="18%">备注</td>
	</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();

		ls_sql="SELECT jc_mmzjx.zjxxh, jc_mmydd.pdgc,DECODE(jc_mmzjx.clzt,'00','录入未完成','01','录入完成','02','工厂已确认','03','已入库','04','安装完成','99','退单'),crm_khxx.khxm,mmzjxyymc,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj,jc_mmzjx.lrsj,c.dwmc lrbm,jc_mmzjx.bz";
		ls_sql+=" FROM crm_khxx,jc_mmzjx,sq_dwxx c,jdm_mmzjxyybm,jc_mmydd  ";
		ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and jc_mmzjx.mmzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
		ls_sql+=" and jc_mmzjx.dwbh=c.dwbh(+)";
		ls_sql+=" and jc_mmzjx.yddbh=jc_mmydd.yddbh ";
		ls_sql+=" and jc_mmzjx.yddbh='"+yddbh+"'";
		ls_sql+=" order by jc_mmzjx.zjxxh";

	//	out.println(ls_sql);
		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("","","","");
		pageObj.setPageRow(10000);//设置每页显示记录数


	//设置列超级连接
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"zjxxh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp?yddbh="+yddbh;//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

		
		pageObj.out=out;
		pageObj.getDate(1);
		pageObj.displayDateSum();

	%> 
	</table>
	<%
}
else{
	%>
	<BR>
	<font color="#FF0033"><b>本订单未发生增减项</b></font> 
	
	<%
}
%>
</div>

<form method="post" action="SaveQxddJc_mmydd.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">扣测量费</td>
      <td width="31%"> 
        <input type="text" name="kclf" value="" size="20" maxlength="16" >
      </td>
      <td width="18%" align="right">退单原因</td>
      <td width="32%"> 
        <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"> 
        退单办理人      </td>
      <td width="31%"> 
        <input type="text" name="tdlrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="18%" align="right"> 
        退单时间      </td>
      <td width="32%"> 
        <input type="text" name="tdsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">退单说明</td>
      <td colspan="3"> 
        <textarea name="tdsm" rows="4" cols="72"></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" align="center"> 
          <input type="button"  value="退单" onClick="f_do(selectform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="yddbh"  value="<%=yddbh%>" >      </td>
    </tr>
  </table>
</form>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      客户编号    </td>
    <td width="31%"> <%=khbh%></td>
    <td width="18%" align="right"> 
      合同号    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      客户姓名    </td>
    <td width="31%"> <%=crm_khxx_khxm%>（
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
）</td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF">签约店面</td>
    <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="18%" align="right">设计师</td>
    <td width="32%"><%=crm_khxx_sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      施工队    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>（<%=dzdh%>） </td>
    <td width="18%" align="right"> 
      班长    </td>
    <td width="32%"><%=sgbz%>（<%=bzdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      家装签约日期    </td>
    <td width="31%"> <%=crm_khxx_qyrq%> </td>
    <td width="18%" align="right"> 
      质检    </td>
    <td width="32%"><%=crm_khxx_zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      合同开工日期    </td>
    <td width="31%"> <%=crm_khxx_kgrq%> </td>
    <td width="18%" align="right"> 
      合同竣工日期    </td>
    <td width="32%"> <%=crm_khxx_jgrq%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="19%" align="right">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      五金情况    </td>
    <td width="31%"> <%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%> </td>
    <td width="18%" align="right"> 
      木门定金    </td>
    <td width="32%"> <%=jc_mmydd_sqdj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right" bgcolor="#99CCFF"> 
      驻店家居顾问    </td>
    <td width="31%"> <%=jc_mmydd_clgw%> </td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      录入人    </td>
    <td width="31%"> <%=jc_mmydd_lrr%> </td>
    <td width="18%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=jc_mmydd_lrsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      录入部门    </td>
    <td width="31%"> <%=sq_dwxx_dwmc%> </td>
    <td width="18%" align="right"> 
      处理状态    </td>
    <td width="32%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" bgcolor="#99CCFF" align="right">备注</td>
    <td colspan="3"><%=jc_mmydd_bz%></td>
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
	if(	javaTrim(FormName.kclf)=="") {
		alert("请选择[扣测量费]！");
		FormName.kclf.focus();
		return false;
	}
	if(!(isFloat(FormName.kclf, "扣测量费"))) {
		return false;
	}
	if(	javaTrim(FormName.jctdyybm)=="") {
		alert("请选择[退单原因]！");
		FormName.jctdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdlrr)=="") {
		alert("请选择[退单办理人]！");
		FormName.tdlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.tdsj)=="") {
		alert("请选择[退单时间]！");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "退单时间"))) {
		return false;
	}
	if(	javaTrim(FormName.tdsm)=="") {
		alert("请选择[退单说明]！");
		FormName.tdsm.focus();
		return false;
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
