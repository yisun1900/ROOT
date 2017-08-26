<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
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

String jc_mmydd_xmzy=null;
String jc_mmydd_ztjjgw=null;
double mmzkl=0;
String dzyy=null;


String sgbz=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String lxfs=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String cxhdbm=null;
String fkje=null;
String jhazsj=null;
String kjxsj=null;
String fwf=null;
String wdzje=null;
String zjhmmje=null;
String zjhwjje=null;
String zjhblje=null;
String zjhze=null;

String sjs=null;
String fgsbh=null;
String khjl=null;

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String zjxxh=null;
String jjwjbz="";
int count=0;

try {
	conn=cf.getConnection();


	ls_sql="select count(*) ";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"' and clzt='00' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！有增减项未完成，不能继续录入新单");
		return;
	}


	ls_sql="select crm_khxx.jjwjbz,jc_mmydd.mmzkl,jc_mmydd.dzyy,crm_khxx.fgsbh,crm_khxx.sjs,crm_khxx.khjl,jc_mmydd.fwf,jc_mmydd.wdzje,jc_mmydd.zjhmmje,jc_mmydd.zjhwjje,jc_mmydd.zjhblje,jhazsj,kjxsj,zjhze,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.ztjjgw as jc_mmydd_ztjjgw,jc_mmydd.xmzy as jc_mmydd_xmzy,jc_mmydd.pdgc as jc_mmydd_pdgc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.mmhtje as jc_mmydd_mmhtje,jc_mmydd.wjhtje as jc_mmydd_wjhtje,jc_mmydd.blhtje as jc_mmydd_blhtje,jc_mmydd.htje as jc_mmydd_htje,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		mmzkl=rs.getDouble("mmzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khjl=cf.fillNull(rs.getString("khjl"));
		fwf=cf.fillNull(rs.getString("fwf"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zjhmmje=cf.fillNull(rs.getString("zjhmmje"));
		zjhwjje=cf.fillNull(rs.getString("zjhwjje"));
		zjhblje=cf.fillNull(rs.getString("zjhblje"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		zjhze=cf.fillNull(rs.getString("zjhze"));
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
		jc_mmydd_xmzy=cf.fillNull(rs.getString("jc_mmydd_xmzy"));
		jc_mmydd_ztjjgw=cf.fillNull(rs.getString("jc_mmydd_ztjjgw"));
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

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}

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
	ls_sql+=" where sq_yhxx.ssfgs='"+fgsbh+"' and yhmc ='"+crm_khxx_zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(substr(zjxxh,10,2)),0)";
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

	zjxxh=yddbh+cf.addZero(count+1,2);

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

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="7%">派单工厂</td>
	<td  width="10%">处理状态</td>
	<td  width="8%">客户姓名</td>
	<td  width="12%">增减项原因</td>
	<td  width="9%">增减项总额</td>
	<td  width="9%">发生时间</td>
	<td  width="9%">录入时间</td>
	<td  width="12%">录入部门</td>
	<td  width="18%">备注</td>
	</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();

		ls_sql="SELECT jc_mmzjx.zjxxh, jc_mmydd.pdgc,DECODE(jc_mmzjx.clzt,'00','录入未完成','01','录入完成','02','工厂已接收','03','已入库','04','安装完成','99','退单'),crm_khxx.khxm,mmzjxyymc,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj,jc_mmzjx.lrsj,c.dwmc lrbm,jc_mmzjx.bz";
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
%>

<table width="100%">
  <tr>
    <td width="100%" height="2"> 
      <div align="center"> 请录入木门增减项（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                客户编号              </td>
              <td width="32%"> <%=khbh%></td>
              <td width="18%" align="right"> 
                合同号              </td>
              <td width="32%"><%=crm_khxx_hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> <%=crm_khxx_khxm%>（
                <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
） </td>
              <td width="18%" align="right">房屋地址 </td>
              <td width="32%"><%=crm_khxx_fwdz%> </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">签约店面</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
              <td width="18%" align="right">家装设计师</td>
              <td width="32%"><%=crm_khxx_sjs%>（<%=sjsdh%>）</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                施工队              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>（<%=dzdh%>） </td>
              <td width="18%" align="right"> 
                班长              </td>
              <td width="32%"><%=sgbz%>（<%=bzdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                家装签约日期              </td>
              <td width="32%"> <%=crm_khxx_qyrq%> </td>
              <td width="18%" align="right"> 
                质检              </td>
              <td width="32%"><%=crm_khxx_zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                合同开工日期              </td>
              <td width="32%"> <%=crm_khxx_kgrq%> </td>
              <td width="18%" align="right"> 
                合同竣工日期              </td>
              <td width="32%"> <%=crm_khxx_jgrq%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right" bgcolor="#CCFFCC">参加促销活动</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right"> 
                五金情况              </td>
              <td width="32%"> <%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%> </td>
              <td width="18%" align="right"> 
                木门定金              </td>
              <td width="32%"> <%=jc_mmydd_sqdj%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right"> 
                项目专员              </td>
              <td width="32%"><%=jc_mmydd_xmzy%> </td>
              <td width="18%" align="right"> 
                处理状态              </td>
              <td width="32%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right" bgcolor="#99CCFF"> 
                驻店家居顾问              </td>
              <td width="32%"> <%=jc_mmydd_clgw%></td>
              <td width="18%" align="right"> 
                展厅家居顾问              </td>
              <td width="32%"><%=jc_mmydd_ztjjgw%> </td>
            </tr>
            
            <tr bgcolor="#99CCFF"> 
              <td width="18%" bgcolor="#99CCFF" align="right">备注</td>
              <td colspan="3"><%=jc_mmydd_bz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">木门合同金额</td>
              <td width="32%"> <%=jc_mmydd_mmhtje%> </td>
              <td width="18%" align="right">增减后木门金额</td>
              <td width="32%"><%=zjhmmje%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">五金合同金额</td>
              <td><%=jc_mmydd_wjhtje%></td>
              <td align="right">增减后五金金额</td>
              <td><%=zjhwjje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">玻璃合同金额</td>
              <td width="32%"> <%=jc_mmydd_blhtje%> </td>
              <td width="18%" align="right">增减后玻璃金额</td>
              <td width="32%"><%=zjhblje%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td bgcolor="#CCCCFF" align="right">服务费</td>
              <td><%=fwf%></td>
              <td align="right">未打折金额</td>
              <td><%=wdzje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" bgcolor="#CCCCFF" align="right">合同金额</td>
              <td width="32%"><%=jc_mmydd_htje%></td>
              <td width="18%" align="right">增减后总额</td>
              <td width="32%"><%=zjhze%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">签合同日期</td>
              <td width="32%"> <%=jc_mmydd_htrq%> </td>
              <td width="18%" align="right">合同签定人</td>
              <td width="32%"> <%=jc_mmydd_htqdr%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">合同备注</td>
              <td colspan="3"><%=jc_mmydd_htbz%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">合同安装时间</td>
              <td width="32%"><%=jhazsj%></td>
              <td width="18%" bgcolor="#CCFFCC" align="right">可减项截止时间</td>
              <td width="32%"><%=kjxsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>订单折扣</td>
              <td colspan="3"><input type="text" name="mmzkl" size="8" maxlength="8" value="<%=mmzkl%>" readonly>
                  <b><font color="#0000FF">（>0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">打折原因</td>
              <td colspan="3"><textarea name="dzyy" cols="71" rows="3" readonly><%=dzyy%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font>增减项原因</td>
              <td width="32%">
                <select name="mmzjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font>计划安装时间</td>
              <td width="32%">
              <input type="text" name="jhazsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font>增减项发生时间</td>
              <td width="32%">
              <input type="text" name="zjxfssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">录入时间</font></td>
              <td width="32%">
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">录入人</font></td>
              <td width="32%">
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">录入部门</font></td>
              <td width="32%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="2">备注</td>
              <td colspan="3" height="2"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
        </table>

          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="3" cellspacing="3">
			<tr align="center"> 
              <td> 
                  <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
                  <input type="hidden" name="qddm" value="<%=crm_khxx_dwbh%>" >
                  <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="hidden" name="khjl" value="<%=khjl%>" >
                  <input type="hidden" name="zjxxh" value="<%=zjxxh%>" readonly>
                  <input type="hidden" name="yddbh" value="<%=yddbh%>" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button"  value="完成" onClick="f_end(insertform)" name="wc" disabled>
                  <input type="button"  value="打印" onClick="window.open('/jcjj/dygl/dymmhtfjzjx.jsp?yddbh=<%=yddbh%>&zjxxh=<%=zjxxh%>')" name="dy" disabled>
			  </td>
            </tr>
			<tr align="center">
			  <td><input type="button"  value="增减已有木门项目" onClick="f_zjmm(insertform)" name="zjmm" disabled>
                <input type="button"  value="增加新木门项目" onClick="f_newmm(insertform)" name="newmm" disabled>
                <input type="button"  value="确定木门增减数量" onClick="f_mmsl(insertform)" name="mmsl" disabled></td>
		    </tr>
			<tr align="center">
			  <td><input type="button"  value="增减已有五金项目" onClick="f_zjwj(insertform)" name="zjwj" disabled>
                <input type="button"  value="增加新五金项目" onClick="f_newwj(insertform)" name="newwj" disabled>
                <input type="button"  value="确定五金增减数量" onClick="f_wjsl(insertform)" name="wjsl" disabled></td>
		    </tr>
			<tr align="center">
			  <td><input type="button"  value="增减已有玻璃项目" onClick="f_zjbl(insertform)" name="zjbl" disabled>
                <input type="button"  value="增加新玻璃项目" onClick="f_newbl(insertform)" name="newbl" disabled>
                <input type="button"  value="确定玻璃增减数量" onClick="f_blsl(insertform)" name="blsl" disabled></td>
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
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.mmzjxyybm)=="") {
		alert("请选择[增减项原因]！");
		FormName.mmzjxyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.jhazsj)=="") {
		alert("请输入[计划安装时间]！");
		FormName.jhazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "计划安装时间"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "增减项发生时间"))) {
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

	if (FormName.zjxfssj.value>FormName.lrsj.value)
	{
		alert("[增减项发生时间]不能大于[录入时间]！");
		FormName.zjxfssj.select();
		return false;
	}
	
	
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.mmzkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.mmzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.mmzkl, "订单折扣"))) {
		return false;
	}
	if (FormName.mmzkl.value<=0 || FormName.mmzkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.mmzkl.select();
		return false;
	}
	if (FormName.mmzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_mmzjx.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;
	FormName.zjmm.disabled=false;
	FormName.newmm.disabled=false;
	FormName.mmsl.disabled=false;
	FormName.zjwj.disabled=false;
	FormName.newwj.disabled=false;
	FormName.wjsl.disabled=false;
	FormName.zjbl.disabled=false;
	FormName.newbl.disabled=false;
	FormName.blsl.disabled=false;
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	FormName.action="EndJc_mmzjx.jsp";
	FormName.submit();
	return true;
}

function f_zjmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	
	FormName.action="Jc_mmdgdmxList.jsp";
	FormName.submit();
	return true;
}

function f_newmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_mmdgdmxMain.jsp";
	FormName.submit();
	return true;
}
function f_mmsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_mmdgdmxZjxList.jsp";
	FormName.submit();
	return true;
}

function f_zjwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_wjjddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_newwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="InsertJc_wjjddmxMain.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_wjsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_wjjddmxZjxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_zjbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}


	FormName.action="Jc_blddmxList.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_newbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="InsertJc_blddmx.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_blsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_blddmxZjxList.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
