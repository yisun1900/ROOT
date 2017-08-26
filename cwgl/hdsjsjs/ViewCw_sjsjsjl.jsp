<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

int row=0;
int xh=0;
String dwmc=null;
String sjfw=null;
String sjfw2=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,sjfw,sjfw2";
	ls_sql+=" from  cw_sjsjsjl,sq_dwxx";
	ls_sql+=" where cw_sjsjsjl.sjsbh=sq_dwxx.dwbh(+) and jsjlh='"+jsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=rs.getString("dwmc");
		sjfw=cf.fillNull(rs.getDate("sjfw"));
		sjfw2=cf.fillNull(rs.getDate("sjfw2"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<div align="center"><b>（<%=dwmc%>）结算清单（<%=sjfw%>--><%=sjfw2%>）</b> </div>
<br><b>签单明细:</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">序号</td>
      <td  width="8%">合同号</td>
       <td  width="6%">设计师</td>
     <td  width="22%">房屋地址</td>
      <td  width="8%"><b><font color="#0000CC">预算金额</font></b></td>
      <td  width="6%"><b>提点</b></td>
      <td  width="8%"><b>可结工资</b></td>
      <td  width="61%"><b>备注</b></td>
    </tr>
    <%

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String sgdmc=null;
	String qyrq=null;
	String ysgcjdmc=null;

	double sjfksbl=0;
	double qye=0;
	double khjsje=0;
	double qdsyjsje=0;
	double qdtcbl=0;
	double qdtcje=0;
	double wgtcbl=0;
	double wgtcje=0;
	double kjgz=0;
	String bz=null;

	double xjqye=0;
	double xjkhjsje=0;
	double xjqdsyjsje=0;
	double xjqdtcje=0;
	double xjwgtcje=0;
	double xjkjgz=0;
	double zjwgtcje=0;

	xh=0;
	xjkhjsje=0;
	xjqdsyjsje=0;
	xjqye=0;
	xjwgtcje=0;
	xjkjgz=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='1' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillHtml(rs.getString("bz"));

		xjqye+=qye;
		xjqdtcje+=qdtcje;
		zjwgtcje+=qdtcje;

		row++;
		xh++;

		%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td><%=xh%></td>
      <td><%=hth%></td>
	  <td><%=sjs%></td>
      <td align="left"><%=fwdz%></td>
      <td><%=qye%></td>
      <td><%=qdtcbl%>%</td>
      <td><%=qdtcje%></td>
      <td align="left"><%=bz%></td>
    </tr>
    <%

	}
	rs.close();
	ps.close();

%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td colspan="3">合 计</td>
      <td>&nbsp;</td>
      <td><%=cf.formatDouble(xjqye)%></td>
      <td>&nbsp;</td>
      <td><%=cf.formatDouble(xjqdtcje)%></td>
      <td>&nbsp;</td>
    </tr>
  </table>

    <b>结算明细:</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">序号</td>
      <td  width="8%">合同号</td>
      <td  width="6%">设计师</td>
      <td  width="22%">房屋地址</td>
      <td  width="8%"><b><font color="#0000CC">结算金额</font></b></td>
      <td  width="6%"><b>提点</b></td>
       <td  width="8%"><b><font color="#0000CC">可结工资</font></b></td>
     <td  width="8%"><b><font color="#0000CC">已结工资</font></b></td>
      <td  width="8%"><b>实领工资</b></td>
      <td  width="21%"><b>备注</b></td>
    </tr>
	<%

	xh=0;
	xjwgtcje=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,crm_khxx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='2' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillHtml(rs.getString("bz"));


		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td  align="left"><%=fwdz%></td>
		  <td><%=khjsje%></td>
		  <td><%=wgtcbl%>%</td>
		  <td><%=cf.formatDouble(khjsje*wgtcbl/100)%></td>
		  <td><%=qdtcje%></td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">合 计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
  </table>

<b>设计客户第一次提成明细（设计费已交50％，但未进行设计费提成的客户）</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">序号</td>
      <td  width="8%">合同号</td>
      <td  width="6%">设计师</td>
      <td  width="22%">房屋地址</td>
      <td  width="8%"><b><font color="#0000CC">签约设计费</font></b></td>
      <td  width="8%"><b>扣佣金费用</b></td>
      <td  width="8%"><b>扣效果图费用</b></td>
      <td  width="8%"><b>扣其它扣款</b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="8%"><b>可结工资</b></td>
      <td  width="18%"><b>备注</b></td>
    </tr>
	<%

	//设计客户
	xjqdtcje=0;

	double kyjfy=0;
	double kxgtfy=0;
	double kqtfy=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='3' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		kyjfy=rs.getDouble("kyjfy");
		kxgtfy=rs.getDouble("kxgtfy");
		kqtfy=rs.getDouble("kqtfy");

		xjqdtcje+=qdtcje;

		zjwgtcje+=qdtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=qye%></td>
		  <td><%=kyjfy%></td>
		  <td><%=kxgtfy%></td>
		  <td><%=kqtfy%></td>

		  <td><%=qdtcbl%>%</td>
		  <td><%=qdtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">合 计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjqdtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>

<b>设计客户第二次提成明细（本段时间内签单且已交全款，但未进行设计师提成的客户）</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">序号</td>
      <td  width="7%">合同号</td>
      <td  width="6%">设计师</td>
      <td  width="18%">房屋地址</td>
      <td  width="8%"><b><font color="#0000CC">实收设计费</font></b></td>
      <td  width="7%"><b>扣佣金费用</b></td>
      <td  width="7%"><b>扣效果图费用</b></td>
      <td  width="7%"><b>扣其它扣款</b></td>
      <td  width="5%"><b>提点</b></td>
     <td  width="8%"><b><font color="#0000CC">已结工资</font></b></td>
      <td  width="8%"><b>可结工资</b></td>
      <td  width="18%"><b>备注</b></td>
    </tr>
	<%

	//设计客户
	xjwgtcje=0;

	kyjfy=0;
	kxgtfy=0;
	kqtfy=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='4' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		kyjfy=rs.getDouble("kyjfy");
		kxgtfy=rs.getDouble("kxgtfy");
		kqtfy=rs.getDouble("kqtfy");

		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=khjsje%></td>
		  <td><%=kyjfy%></td>
		  <td><%=kxgtfy%></td>
		  <td><%=kqtfy%></td>

		  <td><%=wgtcbl%>%</td>
		  <td><%=qdtcje%>%</td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">合 计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>


<b>签单客户退单（退单未结算的客户）</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">序号</td>
      <td  width="8%">合同号</td>
      <td  width="6%">设计师</td>
      <td  width="22%">房屋地址</td>
      <td  width="6%"><b><font color="#0000CC">签单提成金额</font></b></td>
      <td  width="6%"><b><font color="#0000CC">完工提成金额</font></b></td>
      <td  width="8%"><b>可结工资</b></td>
      <td  width="18%"><b>备注</b></td>
    </tr>
	<%

	//设计客户
	xjwgtcje=0;
	double qdwgtcje=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy,crm_khxx.wgtcje qdwgtcje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='5' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");
		qdwgtcje=rs.getDouble("qdwgtcje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));


		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=qdsyjsje%></td>
		  <td><%=qdwgtcje%></td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">合 计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>



<b>设计费退单（退单未结算的客户）</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">序号</td>
      <td  width="8%">合同号</td>
      <td  width="6%">设计师</td>
      <td  width="22%">房屋地址</td>
      <td  width="6%"><b><font color="#0000CC">设计费首次提成金额</font></b></td>
      <td  width="6%"><b><font color="#0000CC">设计费二次提成金额</font></b></td>
      <td  width="8%"><b>可结工资</b></td>
      <td  width="18%"><b>备注</b></td>
    </tr>
	<%

	//设计客户
	xjwgtcje=0;
	double sjfsctcje=0;
	double sjfectcje=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.sjfsctcje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy,crm_khxx.sjfectcje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='6' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		sjfsctcje=rs.getDouble("sjfsctcje");
		sjfectcje=rs.getDouble("sjfectcje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));


		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=sjfsctcje%></td>
		  <td><%=sjfectcje%></td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">合 计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">总 计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(zjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function f_do(formName)
{
	formName.action="SaveEditCw_sjsjsjl.jsp";
	formName.submit();
	return true;
} 

function f_delete(formName,khbh,lx)
{
	if ( confirm("删除后不可恢复，确实要继续吗？") )	
	{
		formName.action="DeleteCw_sjsjsmx.jsp?khbh="+khbh+"&lx="+lx;
		formName.submit();
		return true;
	}
} 

function f_qdjs(FormName,xh)
{
	var kjgz=0;//可结工资=预算金额*提点/100
	kjgz=FormName.qye[xh].value*FormName.td[xh].value/100.0;
	kjgz=round(kjgz,2);
	FormName.kjgz[xh].value=kjgz;
} 

function f_wgjs(FormName,xh)
{
	var kjgz=0;//可结工资=结算金额*提点/100
	kjgz=FormName.khjsje[xh].value*FormName.td[xh].value/100.0;
	kjgz=round(kjgz,2);
	FormName.kjgz[xh].value=kjgz;

	var wgtcje=0;//实领工资=预算金额*提点/100
	wgtcje=FormName.kjgz[xh].value*1.0-FormName.qdsyjsje[xh].value*1.0;
	wgtcje=round(wgtcje,2);
	FormName.wgtcje[xh].value=wgtcje;
} 



//-->
</script>

