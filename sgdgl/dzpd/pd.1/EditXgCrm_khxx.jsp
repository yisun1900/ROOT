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

	ls_sql="select DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,DECODE(NVL(kgzbz,'N'),'Y','�ѳ�����֤','N','δ������֤') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,sjf,glf,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjssmc,ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfssmc,hdsfss ";
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


	ls_sql="select fwdz,sjs,sq_sgd.sgdmc||'��'||sq_sgd.sgd||'��' sgd,sgbz,zjxm";
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
	
	//��ʩ������
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
<title>�ɵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����ɵ�--�޸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">

<%


//ʣ�൥�ܶ�>��ǩԼ��
//ʣ������ĵ���>��ǩԼ���:��>��ǩԼ��е������󵥣��е���>��ǩԼ��
//�п��а���
//���ڽӵ��ܶ�>0
//������>0
//����ֱ���ӡ�Ƿ���ʡ�ʩ���Ӽ������������������

/*
�ܶ�ܳ�
ʣ�൥�ܶ� >= ǩԼ��

�󵥣����̼���󵥶�
syddje>=qye and sydze>=qye  
��ʣ�൥�ܶ�>=ǩԼ� and ��ʣ��󵥽�� >= ǩԼ�

��ʣ�൥�ܶ�>=ǩԼ� and ��ʣ��󵥽�� < ǩԼ� and ��(ʣ��󵥽�ʣ���е����) >= ǩԼ�

��ʣ�൥�ܶ�>=ǩԼ� and ��ʣ��󵥽�� < ǩԼ� and ��(ʣ��󵥽�ʣ���е����) < ǩԼ�

0<syddje<qye and (syddje+syzdje)>=qye and sydze>=qye  ���̣�����󵥶���ּ����е�
0<syddje<qye and (syddje+syzdje)<qye and sydze>=qye  ���̣�����󵥶���ּ����е���С��
syddje��0 and syzdje>=qye and sydze>=qye  ���̣�����󵥶�
syddje��0 and syzdje<qye and sydze>=qye  ���̣�����󵥶�

ʣ�൥�ܶ� < ǩԼ������ɵ�����ʼ�µ��ɵ�����
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

	if (deflbm.equals("1"))//1:��(6������);2:�е�(3��6��);3:С��(3������)
	{
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
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
	else if (deflbm.equals("2"))//1:��(6������);2:�е�(3��6��);3:С��(3������)
	{
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
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

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
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

		c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

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
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>��<%=lxfs%>��</font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#000000">�Ƿ��װ</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><b><%=jzbz%></b></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">����</font></td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right">С��</td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=xqbm%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">��ע</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <%
	if (!ybjbh.equals(""))
	{
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">�ι��������</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjbh%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">������ַ</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjfwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">���ʦ</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsjs%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">�ʼ�����</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjzjxm%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">ʩ����</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgd%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">ʩ������</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgbz%></font></td>
            </tr>
            <%
	}
	if (!hdbz.equals("1")){
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">�ص���־</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,false);
%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#660066">�ص���</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#660066"><%=hdr%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#660066">�ص�װ�޵�ַ</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#660066"><%=cgdz%></font></td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="14%" align="right">������Ƿ���ʵ</td>
              <td width="36%"><font color="#660066"><%=ybjssmc%></font></td>
              <td width="17%" align="right">�ص��Ƿ���ʵ</td>
              <td width="33%"><font color="#660066"><%=hdsfssmc%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b><font color="#0000FF">�ͻ�����</font></b></td>
              <td width="36%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="17%" align="right"><b>���齻������</b></td>
              <td width="33%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b>��ͬ��������</b></td>
              <td width="36%"><font color="#000000"><%=kgrq%></font></td>
              <td width="17%" align="right"><b>��ͬ��������</b></td>
              <td width="33%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">������֤��־</td>
              <td width="36%" bgcolor="#FFFFCC"><%=kgzbz%></td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right"></div>
              </td>
              <td width="33%" bgcolor="#FFFFCC">&nbsp; </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC"> 
                <div align="right">�ɵ���</div>
              </td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="24" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right">�ɵ�ʱ��</div>
              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">����ʩ����</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:670PX" onChange="changeSgd(editform)" >
                  <option value=""></option>
                  <%=hxsgdstr%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">ʩ���೤</td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:180PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' order by bzmc",sgbz);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFCC" align="right">�ʼ�</td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' order by yhmc",zjxm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right">�ɵ�˵��</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="pdsm" cols="73" rows="3"><%=pdsm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="����" onClick="f_do(editform)">
                <%
if (!hdbz.equals("1"))
{
%> 
                <input type="button"  value="��ʵ�ص�" onClick="window.open('/gcgl/hshd/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
                <%
}
if (ybjss.equals("0"))
{
%> 
                <input type="button"  value="��ʵ�����" onClick="window.open('/gcgl/hsybj/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')" name="button">
                <%
}
%> 
                <input type="button"  value="ʩ�����ɵ�ͳ��" onClick="f_cksgd(editform)">
                <input type="button"  value="��ѯ������ʩ����" onClick="f_ckbz(editform)" >
                <input type="reset"  value="����">
                <input type="button"  value="��ӡ�ɹ���" onClick="window.open('/pdgl/pd/DyPdCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("������[�ɵ�ʱ��]��");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}

	FormName.action="SaveEditXgCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}

function f_cksgd(FormName)//����FormName:Form������
{
	FormName.action="PdTjb.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_ckbz(FormName)//����FormName:Form������
{

	FormName.action="EnterFwdz.jsp?fwdz=<%=fwdz%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

