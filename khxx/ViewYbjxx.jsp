<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();	

String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String czbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String fgyqbm=null;
String xxlybm=null;
String zxysbm=null;
String zxsj=null;
String qtqk=null;
String sbyybm=null;
String hth=null;
String sjs=null;
String qye=null;
String jcjjqye=null;
String sfyyh=null;
String yhyy=null;
String fzxm=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String skje=null;
String skrq=null;
String zkje=null;
String zkrq=null;
String sjzkrq=null;
String jgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String dwbh=null;
String pdlx=null;
String zpsgd=null;
String zpyy=null;
String pdclzt=null;
String pdsj=null;
String pdr=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String zxhfsj=null;
String hfjlh=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String ybjbz=null;
String ybjyxq=null;
String ybjdjsj=null;
String hdbz=null;
String zt=null;
String khlxbm=null;
String tsbz=null;
String tsjlh=null;
String tkbz=null;
String tdtkxh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wgbz=null;
String ybjbh=null;

String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;

String ybjss=null;
String hdsfss=null;
String sfzhm=null;
String qyxh=null;
String bxbz=null;
String bxjlh=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("ybjbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
Statement stmt1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bxbz,bxjlh,khbh,khxm,xb,fwdz,cqbm,lxfs,fwlxbm,hxbm,fgflbm,zxjwbm,ysbm,czbm,hxmjbm,fwmj,pmjj,fgyqbm,xxlybm,zxysbm,sbyybm,hth,sjs,qye,jcjjqye,sfyyh,yhyy,fzxm,qyrq,kgrq,sjkgrq,skje,skrq,zkje,zkrq,sjzkrq,jgrq,sjjgrq,gcjdbm,dwbh,pdlx,zpsgd,zpyy,pdclzt,pdsj,pdr,sgd,sgbz,zjxm,zxhfsj,hfjlh,sfxhf,hfrq,hflxbm,ybjbz,ybjyxq,ybjdjsj,hdbz,zt,khlxbm,tsbz,tsjlh,tkbz,tdtkxh,lrr,lrsj,bz,wgbz,ybjbh,cgdz,hdsgd,hdsgbz,hdsjs,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfss,sfzhm,qyxh ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where (zt='2') and  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bxbz=cf.fillNull(rs.getString("bxbz"));
		bxjlh=cf.fillNull(rs.getString("bxjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		xxlybm=cf.fillNull(rs.getString("xxlybm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		jcjjqye=cf.fillNull(rs.getString("jcjjqye"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		fzxm=cf.fillNull(rs.getString("fzxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		skje=cf.fillNull(rs.getString("skje"));
		skrq=cf.fillNull(rs.getDate("skrq"));
		zkje=cf.fillNull(rs.getString("zkje"));
		zkrq=cf.fillNull(rs.getDate("zkrq"));
		sjzkrq=cf.fillNull(rs.getDate("sjzkrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		pdlx=cf.fillNull(rs.getString("pdlx"));
		zpsgd=cf.fillNull(rs.getString("zpsgd"));
		zpyy=cf.fillNull(rs.getString("zpyy"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		ybjbz=cf.fillNull(rs.getString("ybjbz"));
		ybjyxq=cf.fillNull(rs.getDate("ybjyxq"));
		ybjdjsj=cf.fillNull(rs.getDate("ybjdjsj"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		zt=cf.fillNull(rs.getString("zt"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		tsbz=cf.fillNull(rs.getString("tsbz"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		tkbz=cf.fillNull(rs.getString("tkbz"));
		tdtkxh=cf.fillNull(rs.getString("tdtkxh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		wgbz=cf.fillNull(rs.getString("wgbz"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
		hdsjs=cf.fillNull(rs.getString("hdsjs"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		qyxh=cf.fillNull(rs.getString("qyxh"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:12">
<div align="center">�ͻ���Ϣ</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">�ͻ����</div>
    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="17%"> 
      <div align="right">��ϵ��ʽ</div>
    </td>
    <td width="33%"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">�ͻ�����</td>
    <td width="33%"><%=khxm%></td>
    <td width="17%" align="right">�Ա�</td>
    <td width="33%"><%
	cf.radioToken(out, "M+��&W+Ů",xb,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">��������</td>
    <td width="33%" bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%></td>
    <td width="17%" align="right">���ݵ�ַ</td>
    <td width="33%"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">��Ϣ��Դ</td>
    <td width="33%" bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm",xxlybm,true);
%> </td>
    <td width="17%" align="right">ǩԼ���</td>
    <td width="33%"><%=qyxh%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%" align="right">���ʦ</td>
    <td width="33%"><%=sjs%></td>
    <td width="17%" align="right">���̵���</td>
    <td width="33%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%"> 
      <div align="right">�ɵ�����״̬</div>
    </td>
    <td width="33%"> <%
	cf.selectToken(out,"1+�����ɵ�&2+�ɵ�&3+�ܾ��ɵ�&4+�����ɵ�&5+����ԭ��&6+ͬ�����",pdclzt,true);
%> </td>
    <td width="17%"> 
      <div align="right">�ι��������</div>
    </td>
    <td width="33%"><%=ybjbh%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%"> 
      <div align="right">�ɵ���</div>
    </td>
    <td width="33%"> <%=pdr%> </td>
    <td width="17%"> 
      <div align="right">�ɵ�ʱ��</div>
    </td>
    <td width="33%"><%=pdsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%"> 
      <div align="right">ʩ����</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="17%"> 
      <div align="right">ʩ������</div>
    </td>
    <td width="33%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">����ǩԼ��</div>
    </td>
    <td width="33%"><%=qye%> </td>
    <td width="17%"> 
      <div align="right">���ɼҾ�ǩԼ��</div>
    </td>
    <td width="33%"><%=jcjjqye%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">�Ƿ����Ż�</td>
    <td width="33%"><%
	cf.radioToken(out, "Y+��&N+��",sfyyh,true);
%></td>
    <td width="17%" align="right">ÿƽ�׾���</td>
    <td width="33%"><%=pmjj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">�Ż�ԭ��</td>
    <td colspan="3"><%=yhyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">��ͬ��</div>
    </td>
    <td width="33%"><%=hth%> </td>
    <td width="17%"> 
      <div align="right">������Ŀ</div>
    </td>
    <td width="33%"><%=fzxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">ǩԼ����</div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"> <%=qyrq%> </td>
    <td width="17%"> 
      <div align="right">�п���</div>
    </td>
    <td width="33%"><%=zkje%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">Ӧ��������</td>
    <td width="33%"><%=kgrq%></td>
    <td width="17%" align="right">ʵ�ʿ�������</td>
    <td width="33%"><%=sjkgrq%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">�׿�����</div>
    </td>
    <td width="33%"><%=skrq%> </td>
    <td width="17%"> 
      <div align="right">�׿���</div>
    </td>
    <td width="33%"> <%=skje%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">���ڿ�����</div>
    </td>
    <td width="33%"> <%=zkrq%> </td>
    <td width="17%"> 
      <div align="right">���ڿ�ʵ������</div>
    </td>
    <td width="33%"> <%=sjzkrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">Ӧ��������</div>
    </td>
    <td width="33%"> <%=jgrq%> </td>
    <td width="17%"> 
      <div align="right">ʵ�ʿ�������</div>
    </td>
    <td width="33%"> <%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">���̽���</div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"> <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",gcjdbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">�깤��־</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+���깤&N+δ�깤",wgbz,true);
%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">���»ط�ʱ��</div>
    </td>
    <td width="33%" bgcolor="#CCCCFF"> <%=zxhfsj%> </td>
    <td width="17%"> 
      <div align="right">���»طü�¼��</div>
    </td>
    <td width="33%"> <%=hfjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">�Ƿ���ط�</div>
    </td>
    <td width="33%"> <%
	cf.radioToken(out, "Y+��ط�&N+����ط�",sfxhf,true);
%> </td>
    <td width="17%"> 
      <div align="right">Ӧ�ط�����</div>
    </td>
    <td width="33%"> <%=hfrq%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">�ط�����</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",hflxbm,true);
%> </td>
    <td width="17%"> 
      <div align="right"></div>
    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">�������Ч��</div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"> <%=ybjyxq%> </td>
    <td width="17%"> 
      <div align="right">�����Ǽ�ʱ��</div>
    </td>
    <td width="33%"> <%=ybjdjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">������־</td>
    <td width="33%" bgcolor="#FFFFCC"><%
	cf.selectToken(out,"Y+��&N+��",ybjbz,true);
%></td>
    <td width="17%" align="right">����</td>
    <td width="33%"><%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" bgcolor="#FFFFCC"> 
      <div align="right">��ɫ</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">װ�޼�λ</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">����</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">���</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">�������</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">�������</div>
    </td>
    <td width="33%"><%=fwmj%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">Ͷ�߱�־</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+��Ͷ��&N+��Ͷ��",tsbz,true);
%> </td>
    <td width="17%"> 
      <div align="right">Ͷ�߼�¼��</div>
    </td>
    <td width="33%"><%=tsjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">���ޱ�־</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+�б���&N+�ޱ���",bxbz,true);
%> </td>
    <td width="17%"> 
      <div align="right">���޼�¼��</div>
    </td>
    <td width="33%"><%=bxjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">�˵���־</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+���˵�&N+δ�˵�",tkbz,true);
%> </td>
    <td width="17%"> 
      <div align="right">�˵����</div>
    </td>
    <td width="33%"><%=tdtkxh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">�ͻ�����</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">�ص���־</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">�ι۵�ַ</td>
    <td width="33%"><%=cgdz%></td>
    <td width="17%" align="right">�ص����ʦ</td>
    <td width="33%"><%=hdsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">�ص�ʩ����</td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd ",hdsgd,true);
%> </td>
    <td width="17%" align="right">�ص�����</td>
    <td width="33%"> <%=hdsgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">ǩԼ����</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2') order by dwbh",dwbh,true);
%> </td>
    <td width="17%"> 
      <div align="right"></div>
    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">��Ϣ¼����</div>
    </td>
    <td width="33%"><%=lrr%> </td>
    <td width="17%"> 
      <div align="right">¼��ʱ��</div>
    </td>
    <td width="33%"><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">������Ƿ���ʵ</td>
    <td width="33%"><%=ybjss%></td>
    <td width="17%" align="right">�ص��Ƿ���ʵ</td>
    <td width="33%"><%=hdsfss%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">��ע</div>
    </td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>
<P><div align="center">���򼯳ɼҾ���Ϣ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">��Ʒ</td>
	<td  width="15%">��Ӧ��</td>
	<td  width="10%">��Ӧ�̵绰</td>
	<td  width="7%">ʵ�ʷ���</td>
	<td  width="9%">Ӧ��װ����</td>
	<td  width="9%">ʵ��װ����</td>
	<td  width="25%">�����������</td>
	<td  width="7%">��װ</td>
</tr>

<%
	ls_sql="SELECT dm_cpbm.cpmc,sq_dwxx.dwmc,sq_dwxx.dwdh,crm_dgqk.sjfy,crm_dgqk.yazrq ,crm_dgqk.sazrq,ysqk,DECODE(crm_dgqk.azbz,'N','δ��װ','Y','�Ѱ�װ') as crm_dgqk_azbz  ";
	ls_sql+=" FROM crm_dgqk,dm_cpbm,sq_dwxx  ";
    ls_sql+=" where crm_dgqk.cpbm=dm_cpbm.cpbm and crm_dgqk.gys=sq_dwxx.dwbh";
    ls_sql+=" and crm_dgqk.khbh='"+khbh+"'";
    ls_sql+=" order by crm_dgqk.khbh,crm_dgqk.cpbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>

<P><div align="center">�ɵ���¼ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">ʩ����</td>
	<td  width="8%">ʩ������</td>
	<td  width="10%">�ظ�ʱ��</td>
	<td  width="8%">�ظ���</td>
	<td  width="10%">�ظ�����</td>
	<td  width="24%">�ܾ�ԭ��</td>
	<td  width="22%">��ʵ���</td>
	<td  width="10%">�쵼����</td>
</tr>

<%
	ls_sql="SELECT sgdmc sgd,pd_pdjl.sgbz,hfsj,hfr,DECODE(hfjl,'0','δ�ظ�','3','�ܾ��ɵ�','4','�����ɵ�','5','����ԭ��'),jjyy,hsqk,DECODE(ldspjl,'0','δ����','Y','ͬ�����','N','����ԭ��')";
	ls_sql+=" FROM pd_pdjl,sq_sgd";
    ls_sql+=" where pd_pdjl.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and pd_pdjl.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


<P><div align="center">���̻طü�¼ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="11%">�ط�����</td>
	<td  width="27%">�ط�����</td>
	<td  width="11%">�ط�ʱ��</td>
	<td  width="6%">�ط���</td>
	<td  width="10%">��������</td>
	<td  width="8%">����״̬</td>
	<td  width="22%">��ز��Ŵ������</td>
</tr>

<%
	ls_sql="SELECT crm_hfjl.hfjlh ,dm_hflxbm.hflxmc,DECODE(sjshfnr,null,'',sjshfnr,'�裺'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>�ʣ�'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>ʩ��'||sgdhfnr) as hfnr,crm_hfjl.hfsj,crm_hfjl.hfr,sq_dwxx.dwmc,DECODE(clzt,'0','���账��','Y','�Ѵ���','N','δ����'),xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,sq_dwxx,crm_gchffkbm   ";
    ls_sql+=" where crm_gchffkbm.dwbh=sq_dwxx.dwbh(+) and crm_hfjl.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=" and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+) and crm_hfjl.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfjlh","1");//�в����������Hash��
	spanColHash.put("hflxmc","1");//�в����������Hash��
	spanColHash.put("hfnr","1");//�в����������Hash��
	spanColHash.put("hfsj","1");//�в����������Hash��
	spanColHash.put("hfr","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


<%
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	String slfsmc=null;
	String tslxmc=null;
	String tsyymc=null;
	String tsnr=null;
	String slsj=null;
	String clzt=null;
	String zzjgmc=null;

	ls_sql="SELECT crm_tsjl.tsjlh,slfsmc,tslxmc,tsyymc,tsnr,crm_tsjl.slsj,DECODE(clzt,0,'�ǿͷ��Ǽ�',1,'�ͷ�����',2,'����Ͷ��',3,'�᰸') clzt,zzjgmc ";
	ls_sql+=" FROM crm_tsjl,dm_zzjgbm,dm_slfsbm,dm_tslxbm,dm_tsyybm  ";
    ls_sql+=" where crm_tsjl.zzjgbm=dm_zzjgbm.zzjgbm(+) and crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm ";
    ls_sql+=" and crm_tsjl.khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		%>
		<P><div align="center">Ͷ�߱��޼�¼ </div>
		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="4%">��¼��</td>
			<td  width="7%">����ʽ</td>
			<td  width="8%">Ͷ�߱��޴���</td>
			<td  width="12%">Ͷ�߱���С��</td>
			<td  width="37%">Ͷ�߱�������</td>
			<td  width="10%">����ʱ��</td>
			<td  width="8%">����״̬</td>
			<td  width="7%">�����</td>
		</tr>
		<%
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		slfsmc=cf.fillNull(rs.getString("slfsmc"));
		tslxmc=cf.fillNull(rs.getString("tslxmc"));
		tsyymc=cf.fillNull(rs.getString("tsyymc"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slsj=cf.fillNull(rs.getString("slsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		zzjgmc=cf.fillNull(rs.getString("zzjgmc"));
		%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center"><%=tsjlh%></td>
            <td align="center"><%=slfsmc%></td>
            <td align="center"><%=tslxmc%></td>
            <td align="center"><%=tsyymc%></td>
            <td><%=tsnr%></td>
            <td align="center"><%=slsj%></td>
            <td align="center"><%=clzt%></td>
            <td align="center"><%=zzjgmc%></td>
          </tr>
		</table>


		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">�漰����</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">�������</font></div>
            </td>
            <td width="16%"> 
              <div align="center"><font color="#006666">����ʱ��</font></div>
            </td>
            <td width="10%"> 
              <div align="center"><font color="#006666">������</font></div>
            </td>
          </tr>
			<%

			String dwmc=null;
			String clqk=null;
			String clsj=null;
			String clr=null;

			stmt1 = conn.createStatement();

			ls_sql="select dwmc,clqk,clsj,clr";
			ls_sql+=" from  crm_tsclqk,sq_dwxx";
			ls_sql+=" where crm_tsclqk.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"'";
			rs1 =stmt1.executeQuery(ls_sql);
			while (rs1.next())
			{
				dwmc=cf.fillNull(rs1.getString("dwmc"));
				clqk=cf.fillNull(rs1.getString("clqk"));
				clsj=cf.fillNull(rs1.getString("clsj"));
				clr=cf.fillNull(rs1.getString("clr"));
				%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=dwmc%></td>
					<td><%=clqk%></td>
					<td align="center"><%=clsj%></td>
					<td align="center"><%=clr%></td>
				  </tr>
				  <%
			}
			rs1.close();
			%> 
        </table>
		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">�ط�ʱ��</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">�ͻ��ط����</font></div>
            </td>
            <td width="26%"> 
              <div align="center"><font color="#006666">�ط��г��ֵ�������</font></div>
            </td>
          </tr>
          <%
			String khhfqk=null;
			String cxxwt=null;
			String hfsj=null;

			ls_sql="select hfsj,khhfqk,cxxwt";
			ls_sql+=" from  crm_tshfjl";
			ls_sql+=" where tsjlh='"+tsjlh+"'";
			rs1 =stmt1.executeQuery(ls_sql);
			while (rs1.next())
			{
				khhfqk=cf.fillNull(rs1.getString("khhfqk"));
				cxxwt=cf.fillNull(rs1.getString("cxxwt"));
				hfsj=cf.fillNull(rs1.getString("hfsj"));
				%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center" ><%=hfsj%></td>
					<td ><%=khhfqk%></td>
					<td ><%=cxxwt%></td>
				  </tr>
				  <%
			}
			rs1.close();
			%>
        </table>
<%
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 


<P><div align="center">�˵� </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�˵����</td>
	<td  width="10%">�˵�����</td>
	<td  width="30%">�˵�ԭ��</td>
	<td  width="10%">Ӧ�˽��</td>
	<td  width="10%">ʵ�˽��</td>
	<td  width="10%">�Ƿ�ȯ</td>
	<td  width="10%">�Ƿ�����֤</td>
	<td  width="10%">¼��ʱ��</td>
</tr>

<%
	ls_sql="SELECT TO_CHAR(tdtkxh) tdtkxh,dm_yylxbm.yylxmc,tkyy,crm_tdtkdj.ytje,crm_tdtkdj.stje,DECODE(sffj,'Y','��','N','��'),DECODE(sfyrz,'Y','��','N','��'),lrsj  ";
	ls_sql+=" FROM crm_tdtkdj,dm_yylxbm,sq_sgd  ";
    ls_sql+=" where crm_tdtkdj.yylxbm=dm_yylxbm.yylxbm and crm_tdtkdj.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tdtkdj.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

<P><div align="center">������ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">���������</td>
	<td  width="6%">����</td>
	<td  width="9%">�������</td>
	<td  width="50%">������ԭ��</td>
	<td  width="10%">¼����</td>
	<td  width="12%">¼��ʱ��</td>
</tr>

<%
	ls_sql="SELECT TO_CHAR(zjxxh) zjxxh,DECODE(crm_zjxdj.fylxbm,'01','����','02','����'),crm_zjxdj.zjje,dm_zjxyybm.zjxyymc,lrr,lrsj  ";
	ls_sql+=" FROM crm_zjxdj,dm_zjxyybm,sq_sgd  ";
    ls_sql+=" where crm_zjxdj.zjxyybm=dm_zjxyybm.zjxyybm and crm_zjxdj.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

<P><div align="center">��Ʒ������Ϣ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">��Ŀ����</td>
	<td  width="6%">��������</td>
	<td  width="6%">������λ</td>
	<td  width="5%">����</td>
	<td  width="6%">�ܼ�</td>
	<td  width="6%">¼����</td>
	<td  width="9%">¼��ʱ��</td>
</tr>

<%
	ls_sql="SELECT crm_cpbjb.xmmc as crm_cpbjb_xmmc,crm_gmcpmx.gmsl as crm_gmcpmx_gmsl,crm_gmcpmx.jldw as crm_gmcpmx_jldw,TO_CHAR(crm_gmcpmx.dj) as crm_gmcpmx_dj,crm_gmcpmx.zj as crm_gmcpmx_zj,crm_gmcpmx.lrr as crm_gmcpmx_lrr,crm_gmcpmx.lrsj as crm_gmcpmx_lrsj  ";
	ls_sql+=" FROM crm_cpbjb,crm_gmcpmx";
    ls_sql+=" where crm_gmcpmx.xmbh=crm_cpbjb.xmbh ";
    ls_sql+=" and crm_gmcpmx.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gmcpmx.khbh,crm_gmcpmx.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


</body>
</html>
