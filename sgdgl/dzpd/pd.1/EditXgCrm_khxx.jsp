<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
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
String xqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));

String ybjfwdz="";
String ybjsjs="";
String ybjsgd="";
String ybjsgbz="";
String ybjzjxm="";

String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select DECODE(jzbz,'1','家装工程','2','公装工程') jzbz,DECODE(NVL(kgzbz,'N'),'Y','已出开工证','N','未出开工证') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,sjf,glf,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjssmc,ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
		xqbm=cf.fillNull(rs.getString("xqbm"));
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


	ls_sql="select fwdz,sjs,sq_sgd.sgdmc||'（'||sq_sgd.sgd||'）' sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  khbh='"+ybjbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybjfwdz=cf.fillNull(rs.getString("fwdz"));
		ybjsjs=cf.fillNull(rs.getString("sjs"));
		ybjsgd=cf.fillNull(rs.getString("sgd"));
		ybjsgbz=cf.fillNull(rs.getString("sgbz"));
		ybjzjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();


	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx ";
	ls_sql+=" where  dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	String kpjlh=null;
	String deflbm="";
	ls_sql="select kpjlh,deflbm";
	ls_sql+=" from  pd_pdjl ";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kpjlh=rs.getString("kpjlh");
		deflbm=cf.fillNull(rs.getString("deflbm"));
	}
	rs.close();
	ps.close();

	int kxsgds=0;
	ls_sql="select kxsgds";
	ls_sql+=" from  kp_pdkpjl ";
	ls_sql+=" where  kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kxsgds=rs.getInt("kxsgds");
	}
	rs.close();
	ps.close();
	
	//在施工地数
	String lssgd=null;
	int zsbzs=0;
	ls_sql="select sgd,count(*)";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where gcjdbm in('1','2') and  fgsbh='"+ssfgs+"'";
	ls_sql+=" group by sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lssgd=cf.fillNull(rs.getString("sgd"));
		zsbzs=rs.getInt(2);

		ls_sql="update kp_pdkpmx set zsbzs=?";
		ls_sql+=" where  kpjlh='"+kpjlh+"' and sgd='"+lssgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setInt(1,zsbzs);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>派单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">电子派单--修改</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">

<%


//剩余单总额>＝签约额
//剩余该类别的单额>＝签约额，大单:大单>＝签约额；中单：（大单＋中单）>＝签约额
//有空闲班组
//本期接单总额>0
//班组数>0
//排序：直属队、欠单率、施工队级别、排名、班组空闲率

/*
总额不能超
剩余单总额 >= 签约额

大单：存盘记入大单额
syddje>=qye and sydze>=qye  
（剩余单总额>=签约额） and （剩余大单金额 >= 签约额）

（剩余单总额>=签约额） and （剩余大单金额 < 签约额） and （(剩余大单金额＋剩余中单金额) >= 签约额）

（剩余单总额>=签约额） and （剩余大单金额 < 签约额） and （(剩余大单金额＋剩余中单金额) < 签约额）

0<syddje<qye and (syddje+syzdje)>=qye and sydze>=qye  存盘：记入大单额，部分记入中单
0<syddje<qye and (syddje+syzdje)<qye and sydze>=qye  存盘：记入大单额，部分记入中单、小单
syddje＝0 and syzdje>=qye and sydze>=qye  存盘：记入大单额
syddje＝0 and syzdje<qye and sydze>=qye  存盘：记入大单额

剩余单总额 < 签约额：不能派单，开始新的派单周期
*/

	kxsgds=100;
	String c2=null;
	String hxsgd=null;
	String sgdmc=null;
	String kjdsm=null;
	String duihao=null;
	String sgdlx=null;
	double qdl=0;
	String sgdjbbm=null;
	int bqpm=0;
	double bzkxl=0;
	double syddje=0;
	double syzdje=0;
	double syxdje=0;
	String hxsgdstr="";
	String yxsgd="";

	int row=0;

	if (deflbm.equals("1"))//1:大单(6万以上);2:中单(3万—6万);3:小单(3万以下)
	{
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','非直属','S1','直属') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" and kp_pdkpmx.syddje*10000>="+qye;

		ls_sql+=" order by kp_pdkpmx.sgdlx desc,qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

		ls_sql+=" )";
		ls_sql+=" where rownum<="+kxsgds;
//		out.println(ls_sql);
	}
	else if (deflbm.equals("2"))//1:大单(6万以上);2:中单(3万—6万);3:小单(3万以下)
	{
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','非直属','S1','直属') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0";
		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;
		ls_sql+=" order by kp_pdkpmx.sgdlx desc,qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
		ls_sql+=" )";
		ls_sql+=" where rownum<="+kxsgds;
	}
	else{
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','非直属','S1','直属') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0";
		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" order by kp_pdkpmx.sgdlx desc,qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
		ls_sql+=" )";
		ls_sql+=" where rownum<="+kxsgds;
	}

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hxsgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		kjdsm=cf.fillNull(rs.getString("kjdsm"));
		duihao=cf.fillNull(rs.getString("duihao"));
		sgdlx=cf.fillNull(rs.getString("sgdlx"));
		qdl=rs.getDouble("qdl");
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		bqpm=rs.getInt("bqpm");
		bzkxl=rs.getDouble("bzkxl");
		syddje=rs.getDouble("syddje");
		syzdje=rs.getDouble("syzdje");
		syxdje=rs.getDouble("syxdje");

		row++;

		if (row==1)
		{
			yxsgd=hxsgd;
		}

		c2=sgdmc+"（"+sgdlx+"）（欠单率"+qdl+"%）（级别"+sgdjbbm+"）（排名"+bqpm+"）（班组派单率"+bzkxl+"%）（欠大"+syddje+"＋中"+syzdje+"＋小"+syxdje+"）（"+kjdsm+"）";

		hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

		%>
		<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
		<%
	}
	rs.close();
	ps.close();
%>
		  
		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">合同号</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>（<%=lxfs%>）</font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#000000">是否家装</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><b><%=jzbz%></b></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">城区</font></td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right">小区</td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=xqbm%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">录入时间</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <%
	if (!ybjbh.equals(""))
	{
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">参观样板间编号</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjbh%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">样板间地址</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjfwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">设计师</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsjs%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">质检姓名</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjzjxm%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">施工队</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgd%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">施工班组</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgbz%></font></td>
            </tr>
            <%
	}
	if (!hdbz.equals("1")){
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">回单标志</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#660066">回单人</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#660066"><%=hdr%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#660066">回单装修地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#660066"><%=cgdz%></font></td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="14%" align="right">样板间是否属实</td>
              <td width="36%"><font color="#660066"><%=ybjssmc%></font></td>
              <td width="17%" align="right">回单是否属实</td>
              <td width="33%"><font color="#660066"><%=hdsfssmc%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b><font color="#0000FF">客户类型</font></b></td>
              <td width="36%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="17%" align="right"><b>建议交底日期</b></td>
              <td width="33%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b>合同开工日期</b></td>
              <td width="36%"><font color="#000000"><%=kgrq%></font></td>
              <td width="17%" align="right"><b>合同竣工日期</b></td>
              <td width="33%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">出开工证标志</td>
              <td width="36%" bgcolor="#FFFFCC"><%=kgzbz%></td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right"></div>
              </td>
              <td width="33%" bgcolor="#FFFFCC">&nbsp; </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC"> 
                <div align="right">派单人</div>
              </td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="24" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right">派单时间</div>
              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">可派施工队</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:670PX" onChange="changeSgd(editform)" >
                  <option value=""></option>
                  <%=hxsgdstr%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">施工班长</td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:180PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bzmc,bzmc||'（'||dh||'）' from sq_bzxx where sgd='"+sgd+"' order by bzmc",sgbz);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFCC" align="right">质检</td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' order by yhmc",zjxm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right">派单说明</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="pdsm" cols="73" rows="3"><%=pdsm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="保存" onClick="f_do(editform)">
                <%
if (!hdbz.equals("1"))
{
%> 
                <input type="button"  value="核实回单" onClick="window.open('/gcgl/hshd/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
                <%
}
if (ybjss.equals("0"))
{
%> 
                <input type="button"  value="核实样板间" onClick="window.open('/gcgl/hsybj/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')" name="button">
                <%
}
%> 
                <input type="button"  value="施工队派单统计" onClick="f_cksgd(editform)">
                <input type="button"  value="查询附近在施工程" onClick="f_ckbz(editform)" >
                <input type="reset"  value="重输">
                <input type="button"  value="打印派工单" onClick="window.open('/pdgl/pd/DyPdCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
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



<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("请输入[派单时间]！");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "派单时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[被派施工队]！");
		FormName.sgd.focus();
		return false;
	}

	FormName.action="SaveEditXgCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}

function f_cksgd(FormName)//参数FormName:Form的名称
{
	FormName.action="PdTjb.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_ckbz(FormName)//参数FormName:Form的名称
{

	FormName.action="EnterFwdz.jsp?fwdz=<%=fwdz%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

