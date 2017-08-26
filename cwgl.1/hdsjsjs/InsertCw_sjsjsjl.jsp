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
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String sjsbh=request.getParameter("sjsbh");
String sfkl=request.getParameter("sfkl");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");
String jsbz=cf.GB2Uni(request.getParameter("jsbz"));

double sjfksbl=0;//设计费扣税比率
double sjftcbl=0;//设计费提成比率
double sjstcbl=0;//设计师签单提成比率
String ls=null;
ls=request.getParameter("sjfksbl");
try{
	if (!(ls.equals("")))  sjfksbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfksbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费扣税比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjftcbl");
try{
	if (!(ls.equals("")))  sjftcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjftcbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费提成比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjstcbl");
try{
	if (!(ls.equals("")))  sjstcbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjstcbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单客户提点]类型转换发生意外:"+e);
	return;
}

%>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String jsjlh=null;


int row=0;

try {
	conn=cf.getConnection();

	//签单未结算，取签约时间，统计crm_khxx
	
	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,6,4)),0)";
	ls_sql+=" from  cw_sjsjsjl";
	ls_sql+=" where sjsbh='"+sjsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=sjsbh+cf.addZero(count+1,4);

%>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<form method="post" action="" name="listform" target="_blank">
  <center>
    <b>签单结算工地（本段时间内签单，但未进行设计师提成的客户）</b>
</center>
  <table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="2%">序号</td>
      <td  width="5%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="4%">施工队</td>
      <td  width="16%">房屋地址</td>
      <td  width="5%">实收款</td>
      <td  width="3%">实收款比例</td>
      <td  width="6%"><b><font color="#0000CC">预算金额</font></b></td>
      <td  width="4%"><b>提点</b></td>
      <td  width="6%"><b>可结工资</b></td>
      <td  width="36%"><b>备注</b></td>
      <td  width="5%">签约日期</td>
      <td  width="4%">工程进度</td>
    </tr>
    <%

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String sgdmc=null;
	String qyrq=null;
	double qye=0;
	double sfke=0;
	double sfkbl=0;
	String ysgcjdmc=null;

	double qdsyjsje=0;//签单提成金额


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.qye,crm_khxx.sfke,ROUND(crm_khxx.sfke*100.0/crm_khxx.qye) sfkbl";
	ls_sql+=" ,ROUND(crm_khxx.qye*"+sjstcbl+"/100,2) qdsyjsje";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjsjsbz='0' and crm_khxx.zt='2' ";//0：未结算；1：签单结算；2：完工结算
    ls_sql+=" and crm_khxx.sfke*100.0/crm_khxx.qye>="+sfkl;
    ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	if (!sjfw.equals(""))
	{
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	}
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

		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		sfkbl=rs.getDouble("sfkbl");

		qdsyjsje=rs.getDouble("qdsyjsje");//签单提成金额


		row++;

		%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td><%=row%></td>
      <td><%=hth%></td>
      <td><%=sjs%></td>
      <td><%=sgdmc%></td>
      <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
      <td><%=sfke%></td>
      <td><%=sfkbl%>%</td>
      <td><%=qye%> 
        <input type="hidden" name="qye" value="<%=qye%>">
      </td>
      <td> 
        <input type="text" name="sjstcbl" value="<%=sjstcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_qdjs(listform,<%=(row-1)%>)">
        % </td>
      <td> 
        <input type="text" name="qdsyjsje" value="<%=qdsyjsje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
      </td>
      <td> 
        <input type="text" name="qdtcbz" size="69" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
        <input type="hidden" name="qdtckhbh" value="<%=khbh%>">
      </td>
      <td><%=qyrq%></td>
      <td><%=ysgcjdmc%></td>
    </tr>
    <%

	}
	rs.close();
	ps.close();

%> 
	<input type="hidden" name="qye" value="">
	<input type="hidden" name="sjstcbl" value="">
	<input type="hidden" name="qdsyjsje" value="">
	<input type="hidden" name="qdtcbz" value="">
	<input type="hidden" name="qdtckhbh" value="">
</table>

<center>
    <b>完工结算工地（本段时间内交的尾款，但未进行完工提成的客户）</b>
</center>
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="2%">序号</td>
      <td  width="5%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="4%">施工队</td>
      <td  width="16%">房屋地址</td>
      <td  width="5%">交款时间</td>
      <td  width="6%"><b><font color="#0000CC">客户结算金额</font></b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="6%"><b>可结工资</b></td>
      <td  width="6%"><b><font color="#0000CC">预算金额</font></b></td>
      <td  width="6%"><b><font color="#0000CC">已结工资</font></b></td>
      <td  width="6%"><b>实领工资</b></td>
      <td  width="20%"><b>备注</b></td>
      <td  width="5%">签约日期</td>
      <td  width="4%">工程进度</td>
    </tr>
	<%

	row=0;


	String jzkfksj=null;//交款时间
	double khjsje=0;//客户结算金额

	double wgtckjgz =0;//完工提成可结工资
	double wgtcje =0;//完工提成金额


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.jzkfksj,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.qye,crm_khxx.khjsje,crm_khxx.sjstcbl,crm_khxx.qdsyjsje";
	ls_sql+=" ,ROUND(khjsje*sjstcbl/100,2) wgtckjgz,ROUND(khjsje*sjstcbl/100-qdsyjsje,2) wgtcje";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjsjsbz='1' and crm_khxx.zt='2'";//0：未结算；1：签单结算；2：完工结算

	ls_sql+=" and crm_khxx.sfyjqk='Y'";//N：未交全款；Y：已交全款
    
	ls_sql+=" and crm_khxx.jzkfksj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	if (!sjfw.equals(""))
	{
		ls_sql+=" and crm_khxx.jzkfksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	}
    ls_sql+=" order by jzkfksj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		jzkfksj=cf.fillNull(rs.getDate("jzkfksj"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		sjstcbl=rs.getDouble("sjstcbl");
		qdsyjsje=rs.getDouble("qdsyjsje");

		wgtckjgz=rs.getDouble("wgtckjgz");
		wgtcje=rs.getDouble("wgtcje");


		row++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=row%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td><%=jzkfksj%></td>
		  <td><%=khjsje%> 
			<input type="hidden" name="khjsje" value="<%=khjsje%>">
		  </td>
		  <td> 
			<input type="text" name="sjswgtcbl" value="<%=sjstcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_wgjs(listform,<%=(row-1)%>)">
			% </td>
		  <td> 
			<input type="text" name="wgtckjgz" value="<%=wgtckjgz%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td><%=qye%> 
		  </td>
		  <td><%=qdsyjsje%> 
			<input type="hidden" name="qdtcyjgz" value="<%=qdsyjsje%>">
		  </td>
		  <td> 
			<input type="text" name="wgtcje" value="<%=wgtcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="wgtcbz" size="37" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<input type="hidden" name="wgtckhbh" value="<%=khbh%>">
		  </td>
		  <td><%=qyrq%></td>
		  <td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<input type="hidden" name="khjsje" value="">
	<input type="hidden" name="sjswgtcbl" value="">
	<input type="hidden" name="wgtckjgz" value="">
	<input type="hidden" name="qdtcyjgz" value="">
	<input type="hidden" name="wgtcje" value="">
	<input type="hidden" name="wgtcbz" value="">
	<input type="hidden" name="wgtckhbh" value="">
  </table>


<center>
    <b>设计客户第一次提成明细（设计费已交50％，但未进行设计费提成的客户）</b>
</center>
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="2%">序号</td>
      <td  width="5%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="4%">施工队</td>
      <td  width="16%">房屋地址</td>
      <td  width="5%">实收设计费</td>
      <td  width="6%"><b><font color="#0000CC">签约设计费</font></b></td>
      <td  width="6%"><b>扣佣金费用</b></td>
      <td  width="6%"><b>扣效果图费用</b></td>
      <td  width="6%"><b>扣其它扣款</b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="6%"><b>可结工资</b></td>
      <td  width="18%"><b>备注</b></td>
      <td  width="5%">签约日期</td>
      <td  width="4%">工程进度</td>
    </tr>
	<%

	//设计客户
	double sjf=0;
	double sssjf=0;
	double sjfsctcje=0;

	row=0;

	ls_sql="SELECT sjf,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.sjf,ROUND(crm_khxx.sjf*(100-"+sjfksbl+")/100*"+sjftcbl+"/200,2) sjfsctcje";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjf>0 and crm_khxx.zt in('2','5')";
    ls_sql+=" and (crm_khxx.sjssjfjsbz is null OR crm_khxx.sjssjfjsbz='0' )";//0：未结算；1：首次提成；2：二次提成
    ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	if (!sjfw.equals(""))
	{
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	}
    ls_sql+=" order by qyrq";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		sjf=rs.getDouble("sjf");
		sjfsctcje=rs.getDouble("sjfsctcje");

		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='55' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sssjf=rs1.getDouble(1);//已收设计费
		}
		rs1.close();
		ps1.close();

		double zcsfs=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='55' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zcsfs=rs1.getDouble(1);//转出设计费
		}
		rs1.close();
		ps1.close();

		sssjf=sssjf-zcsfs;

		if (sssjf+1<sjf/2)//实收款达到50％
		{
			continue;
		}

		row++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=row%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td><%=sssjf%> 
		  </td>
		  <td><%=sjf%> 
			<input type="hidden" name="sjf" value="<%=sjf%>" >
		  </td>
		  <td> 
			<input type="text" name="kyjfy" value="0" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfscjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="kxgtfy" value="0" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfscjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="kqtfy" value="0" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfscjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="sjfsctcbl" value="<%=sjftcbl/2%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfscjs(listform,<%=(row-1)%>)">
			% </td>
		  <td> 
			<input type="text" name="sjfsctcje" value="<%=sjfsctcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sjfsctcbz" size="33" maxlength="100" value="扣除<%=sjfksbl%>％税后计提" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<input type="hidden" name="sjfsctckhbh" value="<%=khbh%>">
		  </td>
		  <td><%=qyrq%></td>
		  <td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<input type="hidden" name="sjf" value="" >
	<input type="hidden" name="kyjfy" value="">
	<input type="hidden" name="kxgtfy" value="">
	<input type="hidden" name="kqtfy" value="">
	<input type="hidden" name="sjfsctcbl" value="">
	<input type="hidden" name="sjfsctcje" value="">
	<input type="hidden" name="sjfsctcbz" value="">
	<input type="hidden" name="sjfsctckhbh" value="">
</table>




<center>
    <b>设计客户第二次提成明细（本段时间内签单且已交全款，但未进行设计师提成的客户）</b>
</center>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="2%">序号</td>
      <td  width="4%">合同号</td>
      <td  width="3%">设计师</td>
      <td  width="4%">施工队</td>
      <td  width="12%">房屋地址</td>
      <td  width="5%"><b><font color="#0000CC">签约设计费</font></b></td>
      <td  width="5%"><b><font color="#0000CC">实收设计费</font></b></td>
      <td  width="5%"><b>扣佣金费用</b></td>
      <td  width="5%"><b>扣效果图费用</b></td>
      <td  width="5%"><b>扣其它扣款</b></td>
      <td  width="5%"><b>提点</b></td>
      <td  width="7%"><b>可结工资</b></td>
      <td  width="5%"><b><font color="#0000CC">已结工资</font></b></td>
      <td  width="5%"><b>实领工资</b></td>
      <td  width="16%"><b>备注</b></td>
      <td  width="4%">签约日期</td>
      <td  width="4%">工程进度</td>
    </tr>
	<%

	//设计客户
	sjf=0;
	sssjf=0;
	double eckyjfy=0;
	double eckxgtfy=0;
	double eckqtfy=0;

	double sjfyjgz=0;//已结工资
	double sjfkjgz=0;//可结工资
	double sjfectcbl=0;//提点
	double sjfectcje=0;//实领工资

	row=0;

	ls_sql="SELECT sjf,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.sjfsctcje";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjf>0 and crm_khxx.zt in('2','5')";
    ls_sql+=" and crm_khxx.sjssjfjsbz='1'";//0：未结算；1：首次提成；2：二次提成
    ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	if (!sjfw.equals(""))
	{
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	}

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjf=rs.getDouble("sjf");
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		sjfyjgz=rs.getDouble("sjfsctcje");

		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='55' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sssjf=rs1.getDouble(1);//已收设计费
		}
		rs1.close();
		ps1.close();

		double zcsfs=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='55' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zcsfs=rs1.getDouble(1);//转出设计费
		}
		rs1.close();
		ps1.close();

		sssjf=sssjf-zcsfs;

		if (sssjf+1<sjf)
		{
			continue;
		}


		ls_sql="select kyjfy,kxgtfy,kqtfy";
		ls_sql+=" from  cw_sjsjsmx";
		ls_sql+=" where khbh='"+khbh+"' and lx='3'";//3：设计费首次提成
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			eckyjfy=rs1.getDouble("kyjfy");
			eckxgtfy=rs1.getDouble("kxgtfy");
			eckqtfy=rs1.getDouble("kqtfy");
		}
		rs1.close();
		ps1.close();
		

		sjfectcbl=sjftcbl;
		
		sjfkjgz=cf.round(  (sssjf*(100-sjfksbl)/100-eckyjfy-eckxgtfy-eckqtfy  )*sjfectcbl/100 ,2 );

		sjfectcje=cf.round(sjfkjgz-sjfyjgz,2);
		
		
		row++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=row%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td><%=sjf%> 
		  </td>
		  <td><%=sssjf%> 
			<input type="hidden" name="sssjf" value="<%=sssjf%>">
		  </td>
		  <td> 
			<input type="text" name="eckyjfy" value="<%=eckyjfy%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="eckxgtfy" value="<%=eckxgtfy%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="eckqtfy" value="<%=eckqtfy%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="sjfectcbl" value="<%=sjfectcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
			% </td>
		  <td> 
			<input type="text" name="sjfkjgz" value="<%=sjfkjgz%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td><%=sjfyjgz%> 
			<input type="hidden" name="sjfyjgz" value="<%=sjfyjgz%>">
		  </td>
		  <td> 
			<input type="text" name="sjfectcje" value="<%=sjfectcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sjfectcbz" size="34" maxlength="100" value="扣除<%=sjfksbl%>％税后计提" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<input type="hidden" name="sjfectckhbh" value="<%=khbh%>">
		  </td>
		  <td><%=qyrq%></td>
		  <td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sjf,crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.sjfsctcje";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjfjssqb";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjf>0 and crm_khxx.zt in('2','5')";
    ls_sql+=" and crm_khxx.sjssjfjsbz='1'";//0：未结算；1：首次提成；2：二次提成
    ls_sql+=" and crm_khxx.khbh=cw_sjfjssqb.khbh";
    ls_sql+=" and cw_sjfjssqb.clzt='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjf=rs.getDouble("sjf");
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		sjfyjgz=rs.getDouble("sjfsctcje");

		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='55' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sssjf=rs1.getDouble(1);//已收设计费
		}
		rs1.close();
		ps1.close();

		double zcsfs=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='55' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zcsfs=rs1.getDouble(1);//转出设计费
		}
		rs1.close();
		ps1.close();

		sssjf=sssjf-zcsfs;


		ls_sql="select kyjfy,kxgtfy,kqtfy";
		ls_sql+=" from  cw_sjsjsmx";
		ls_sql+=" where khbh='"+khbh+"' and lx='3'";//3：设计费首次提成
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			eckyjfy=rs1.getDouble("kyjfy");
			eckxgtfy=rs1.getDouble("kxgtfy");
			eckqtfy=rs1.getDouble("kqtfy");
		}
		rs1.close();
		ps1.close();
		

		sjfectcbl=sjftcbl;
		
		sjfkjgz=cf.round(  (sssjf*(100-sjfksbl)/100-eckyjfy-eckxgtfy-eckqtfy  )*sjfectcbl/100 ,2 );

		sjfectcje=cf.round(sjfkjgz-sjfyjgz,2);
		
		
		row++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=row%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td><%=sjf%> 
		  </td>
		  <td><%=sssjf%> 
			<input type="hidden" name="sssjf" value="<%=sssjf%>">
		  </td>
		  <td> 
			<input type="text" name="eckyjfy" value="<%=eckyjfy%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="eckxgtfy" value="<%=eckxgtfy%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="eckqtfy" value="<%=eckqtfy%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
		  </td>
		  <td> 
			<input type="text" name="sjfectcbl" value="<%=sjfectcbl%>" size="4" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_sjfecjs(listform,<%=(row-1)%>)">
			% </td>
		  <td> 
			<input type="text" name="sjfkjgz" value="<%=sjfkjgz%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td><%=sjfyjgz%> 
			<input type="hidden" name="sjfyjgz" value="<%=sjfyjgz%>">
		  </td>
		  <td> 
			<input type="text" name="sjfectcje" value="<%=sjfectcje%>" size="9" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sjfectcbz" size="34" maxlength="100" value="扣除<%=sjfksbl%>％税后计提" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<input type="hidden" name="sjfectckhbh" value="<%=khbh%>">
		  </td>
		  <td><%=qyrq%></td>
		  <td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<input type="hidden" name="sssjf" value="">
	<input type="hidden" name="eckyjfy" value="">
	<input type="hidden" name="eckxgtfy" value="">
	<input type="hidden" name="eckqtfy" value="">
	<input type="hidden" name="sjfectcbl" value="">
	<input type="hidden" name="sjfkjgz" value="">
	<input type="hidden" name="sjfyjgz" value="">
	<input type="hidden" name="sjfectcje" value="">
	<input type="hidden" name="sjfectcbz" value="">
	<input type="hidden" name="sjfectckhbh" value="">
</table>




<center>
    <b>签单客户退单（退单未结算的客户）</b>
</center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="2%">序号</td>
      <td  width="5%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="4%">施工队</td>
      <td  width="16%">房屋地址</td>
      <td  width="5%">交款时间</td>
      <td  width="6%"><b><font color="#0000CC">签单提成金额</font></b></td>
      <td  width="6%"><b><font color="#0000CC">完工提成金额</font></b></td>
      <td  width="6%"><b>可结工资</b></td>
      <td  width="20%"><b>备注</b></td>
      <td  width="5%">签约日期</td>
      <td  width="4%">工程进度</td>
    </tr>
	<%

	row=0;


	double yqdsyjsje =0;//已签单提成金额
	double ywgtcje =0;//已完工提成金额
	double qdkhtjsk =0;//签单客户退结算款


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.jzkfksj,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.qdsyjsje,crm_khxx.wgtcje,-1*(crm_khxx.qdsyjsje+crm_khxx.wgtcje) qdkhtjsk";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjsjsbz!='3' and crm_khxx.zt='3'";//0：未结算；1：签单结算；2：完工结算；3：退单结算
    ls_sql+=" order by jzkfksj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		jzkfksj=cf.fillNull(rs.getDate("jzkfksj"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		yqdsyjsje=rs.getDouble("qdsyjsje");
		ywgtcje=rs.getDouble("wgtcje");
		qdkhtjsk=rs.getDouble("qdkhtjsk");

		row++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=row%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td><%=jzkfksj%></td>
		  <td><%=yqdsyjsje%> 
		  </td>
		  <td><%=ywgtcje%> 
		  </td>
		  <td><%=qdkhtjsk%> 
			<input type="hidden" name="qdkhtjsk" value="<%=qdkhtjsk%>">
		  </td>
		  <td> 
			<input type="text" name="qdkhtdbz" size="37" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<input type="hidden" name="qdkhtdkhbh" value="<%=khbh%>">
		  </td>
		  <td><%=qyrq%></td>
		  <td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
  </table>



<center>
    <b>设计费退单（退单未结算的客户）</b>
</center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="2%">序号</td>
      <td  width="5%">合同号</td>
      <td  width="4%">设计师</td>
      <td  width="4%">施工队</td>
      <td  width="16%">房屋地址</td>
      <td  width="5%">交款时间</td>
      <td  width="6%"><b><font color="#0000CC">设计费首次提成金额</font></b></td>
      <td  width="6%"><b><font color="#0000CC">设计费二次提成比率</font></b></td>
      <td  width="6%"><b>可结工资</b></td>
      <td  width="20%"><b>备注</b></td>
      <td  width="5%">签约日期</td>
      <td  width="4%">工程进度</td>
    </tr>
	<%

	row=0;


	double ysjfsctcje =0;//已设计费首次提成金额
	double ysjfectcje =0;//已设计费二次提成金额
	double sjkhtjsk =0;//设计客户退结算款


	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.jzkfksj,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,crm_khxx.sjfsctcje,crm_khxx.sjfectcje,-1*(crm_khxx.sjfsctcje+crm_khxx.sjfectcje) sjkhtjsk";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.sjsbh='"+sjsbh+"' and crm_khxx.sjssjfjsbz!='3' and crm_khxx.zt='3'";//0：未结算；1：签单结算；2：完工结算；3：退单结算
    ls_sql+=" order by jzkfksj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		jzkfksj=cf.fillNull(rs.getDate("jzkfksj"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		ysjfsctcje=rs.getDouble("sjfsctcje");
		ysjfectcje=rs.getDouble("sjfectcje");
		sjkhtjsk=rs.getDouble("sjkhtjsk");

		row++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=row%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td><%=sgdmc%></td>
		  <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=fwdz%></A></td>
		  <td><%=jzkfksj%></td>
		  <td><%=ysjfsctcje%> 
		  </td>
		  <td><%=ysjfectcje%> 
		  </td>
		  <td><%=sjkhtjsk%> 
			<input type="hidden" name="sjkhtjsk" value="<%=sjkhtjsk%>">
		  </td>
		  <td> 
			<input type="text" name="sjkhtdbz" size="37" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			<input type="hidden" name="sjkhtdkhbh" value="<%=khbh%>">
		  </td>
		  <td><%=qyrq%></td>
		  <td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
  </table>


<table border="0" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
  <tr align="center"> 
	  <td colspan="4" height="44"> 
        <input type="hidden" name="jsjlh" value="<%=jsjlh%>">
        <input type="hidden" name="fgsbh" value="<%=fgsbh%>">
        <input type="hidden" name="dwbh" value="<%=dwbh%>">
        <input type="hidden" name="sjsbh" value="<%=sjsbh%>">
        <input type="hidden" name="sjfw" value="<%=sjfw%>">
        <input type="hidden" name="sjfw2" value="<%=sjfw2%>">
        <input type="hidden" name="sjfksbl" value="<%=sjfksbl%>">
        <input type="hidden" name="jsbz" value="<%=jsbz%>">

        <input type="button" name="td" value=" 结 算 " onClick="f_do(listform)">
      </td>
  </tr>
</table>

</form>

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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
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
	formName.action="SaveInsertCw_sjsjsjl.jsp";
	formName.submit();
	return true;
} 

function f_qdjs(FormName,xh)
{
	var qdsyjsje=0;//可结工资=预算金额*提点/100
	qdsyjsje=FormName.qye[xh].value*FormName.sjstcbl[xh].value/100.0;
	qdsyjsje=round(qdsyjsje,2);
	FormName.qdsyjsje[xh].value=qdsyjsje;
} 

function f_wgjs(FormName,xh)
{
	var wgtckjgz=0;//可结工资=结算金额*提点/100
	wgtckjgz=FormName.khjsje[xh].value*FormName.sjswgtcbl[xh].value/100.0;
	wgtckjgz=round(wgtckjgz,2);
	FormName.wgtckjgz[xh].value=wgtckjgz;

	var wgtcje=0;//实领工资=预算金额*提点/100
	wgtcje=FormName.wgtckjgz[xh].value*1.0-FormName.qdtcyjgz[xh].value*1.0;
	wgtcje=round(wgtcje,2);
	FormName.wgtcje[xh].value=wgtcje;
} 

function f_sjfscjs(FormName,xh)
{
	var sjfsctcje=0;//可结工资=(签约设计费-扣佣金费用-扣效果图费用-扣其它扣款 )*提点/100
	sjfsctcje=(FormName.sjf[xh].value*(<%=(100-sjfksbl)/100.0%>)-FormName.kyjfy[xh].value-FormName.kxgtfy[xh].value-FormName.kqtfy[xh].value)*FormName.sjfsctcbl[xh].value/100.0;
	sjfsctcje=round(sjfsctcje,2);
	FormName.sjfsctcje[xh].value=sjfsctcje;

} 


function f_sjfecjs(FormName,xh)
{
	var sjfkjgz=0;//可结工资
	sjfkjgz=(FormName.sssjf[xh].value*(<%=(100-sjfksbl)/100.0%>)-FormName.eckyjfy[xh].value-FormName.eckxgtfy[xh].value-FormName.eckqtfy[xh].value)*FormName.sjfectcbl[xh].value/100.0;
	sjfkjgz=round(sjfkjgz,2);
	FormName.sjfkjgz[xh].value=sjfkjgz;

	var sjfectcje=0;//实领工资
	sjfectcje=FormName.sjfkjgz[xh].value*1.0-FormName.sjfyjgz[xh].value*1.0;
	sjfectcje=round(sjfectcje,2);
	FormName.sjfectcje[xh].value=sjfectcje;
} 



//-->
</script>

