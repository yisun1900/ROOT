<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khzq=request.getParameter("khzq");
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String tcqssj=null;
String tcjzsj=null;

String hth=null;
String khxm=null;
String fwdz=null;
String sjsjsbz=null;
String sjsjsbzmc=null;
String hdlxmc=null;

String hdbz=null;
String tckh=null;

String dianz=null;
String weny=null;
String khjl=null;
String sjs=null;
String cly=null;
String zjxm=null;
String xqzg=null;
String xqzz=null;
String xqzy=null;
String wlyxzg=null;
String yxzy=null;
String wzch=null;
String wysj=null;
String wzcxy=null;
String dhzy=null;
String wztgy=null;
String siji=null;

int fwmj=0;
double sjf=0;
double ycf=0;
double zqje=0;
double zk=0;
double suijin=0;
double zhjtjs=0;
double zjxje=0;
double zjxbl=0;
double tcwzczx=0;

double dzsjftcbl=0;
double dzqysjftc=0;
double dzjssjftc=0;
double dzzxftcbl=0;
double dzqyzxtc=0;
double dzjszxtc=0;
double dztcxj=0;
double dzkhbl=0;
double dztcze=0;
double wyzxftcbl=0;
double wyqyzxtc=0;
double wyjszxtc=0;
double khjlsjftcbl=0;
double khjlqysjftc=0;
double khjljssjftc=0;
double khjlzxftcbl=0;
double khjlqyzxtc=0;
double khjljszxtc=0;
double khjltcxj=0;
double khjlkhbl=0;
double khjltcze=0;
double sjssjftcbl=0;
double sjsqysjftc=0;
double sjsjssjftc=0;
double sjszxftcbl=0;
double sjsqyzxtc=0;
double sjsjszxtc=0;
double sjsycftcbl=0;
double sjsycftc=0;
double sjstchj=0;
double zjzxftcbl=0;
double zjqyzxtc=0;
double zjjszxtc=0;
double zjycftcbl=0;
double zjycftc=0;
double zjtcxj=0;
double zjkhbl=0;
double zjtchj=0;
double clyzxftcbl=0;
double clyqyzxtc=0;
double clyjszxtc=0;
double clykhbl=0;
double clytc=0;
double xqzgzxftcbl=0;
double xqzgqyzxtc=0;
double xqzgjszxtc=0;
double xqzgkhbl=0;
double xqzgtc=0;
double xqzzzxftcbl=0;
double xqzzqyzxtc=0;
double xqzzjszxtc=0;
double xqzzkhbl=0;
double xqzztc=0;
double xqzyzxftcbl=0;
double xqzyqyzxtc=0;
double xqzyjszxtc=0;
double xqzykhbl=0;
double xqzytc=0;
double wlyxzgzxftcbl=0;
double wlyxzgqyzxtc=0;
double wlyxzgjszxtc=0;
double wlyxzgkhbl=0;
double wlyxzgtc=0;
double yxzyzxftcbl=0;
double yxzyqyzxtc=0;
double wzchzxftcbl=0;
double wzchqyzxtc=0;
double wysjzxftcbl=0;
double wysjqyzxtc=0;
double wzcxyzxftcbl=0;
double wzcxyqyzxtc=0;
double dhzyzxftcbl=0;
double dhzyqyzxtc=0;
double wztgyzxftcbl=0;
double wztgyqyzxtc=0;
double wztgyjszxtc=0;
double wztgykhbl=0;
double wztgytc=0;
double sjzxftcbl=0;
double sjqyzxtc=0;
double jjze=0;

String lx=null;
String lrr=null;
String lrsj=null;
String bz=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select TO_CHAR(tcqssj,'YYYY-MM-DD'),TO_CHAR(tcjzsj,'YYYY-MM-DD') ";
	ls_sql+=" from  cw_jrtcph";
	ls_sql+=" where khzq='"+khzq+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcqssj=rs.getString(1);
		tcjzsj=rs.getString(2);
	}
	rs.close();
	ps.close();
	
	ls_sql =" select cw_jrtcmx.khbh,cw_jrtcmx.hdbz,cw_jrtcmx.tckh,cw_jrtcmx.dianz,cw_jrtcmx.weny,cw_jrtcmx.khjl,cw_jrtcmx.sjs,cw_jrtcmx.cly,cw_jrtcmx.zjxm,cw_jrtcmx.xqzg,cw_jrtcmx.xqzz,cw_jrtcmx.xqzy,cw_jrtcmx.wlyxzg,cw_jrtcmx.yxzy,cw_jrtcmx.wzch,cw_jrtcmx.wysj,cw_jrtcmx.wzcxy,cw_jrtcmx.dhzy,cw_jrtcmx.wztgy,cw_jrtcmx.siji ";
	ls_sql+=" ,cw_jrtcmx.fwmj,cw_jrtcmx.sjf,cw_jrtcmx.ycf,cw_jrtcmx.zqje,cw_jrtcmx.zk,cw_jrtcmx.suijin,cw_jrtcmx.zhjtjs,cw_jrtcmx.zjxje,cw_jrtcmx.zjxbl,cw_jrtcmx.tcwzczx ";
	ls_sql+=" ,dzsjftcbl,dzqysjftc,dzjssjftc,dzzxftcbl,dzqyzxtc,dzjszxtc,dztcxj,dzkhbl,dztcze,wyzxftcbl,wyqyzxtc,wyjszxtc,khjlsjftcbl,khjlqysjftc,khjljssjftc,khjlzxftcbl,khjlqyzxtc,khjljszxtc,khjltcxj,khjlkhbl,khjltcze,sjssjftcbl,sjsqysjftc,sjsjssjftc,sjszxftcbl,sjsqyzxtc,sjsjszxtc,sjsycftcbl,sjsycftc,sjstchj,zjzxftcbl,zjqyzxtc,zjjszxtc,zjycftcbl,zjycftc,zjtcxj,zjkhbl,zjtchj,clyzxftcbl,clyqyzxtc,clyjszxtc,clykhbl,clytc,xqzgzxftcbl,xqzgqyzxtc,xqzgjszxtc,xqzgkhbl,xqzgtc,xqzzzxftcbl,xqzzqyzxtc,xqzzjszxtc,xqzzkhbl,xqzztc,xqzyzxftcbl,xqzyqyzxtc,xqzyjszxtc,xqzykhbl,xqzytc,wlyxzgzxftcbl,wlyxzgqyzxtc,wlyxzgjszxtc,wlyxzgkhbl,wlyxzgtc,yxzyzxftcbl,yxzyqyzxtc,wzchzxftcbl,wzchqyzxtc,wysjzxftcbl,wysjqyzxtc,wzcxyzxftcbl,wzcxyqyzxtc,dhzyzxftcbl,dhzyqyzxtc,wztgyzxftcbl,wztgyqyzxtc,wztgyjszxtc,wztgykhbl,wztgytc,sjzxftcbl,sjqyzxtc,jjze,cw_jrtcmx.lx,cw_jrtcmx.lrr,cw_jrtcmx.lrsj,cw_jrtcmx.bz ";
	ls_sql+=" ,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,hdlxmc ";
	ls_sql+=" from  crm_khxx,cw_jrtcmx,dm_hdlxbm";
	ls_sql+=" where cw_jrtcmx.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and  cw_jrtcmx.hdbz=dm_hdlxbm.hdlxbm(+)";
	ls_sql+=" and cw_jrtcmx.khzq='"+khzq+"' and crm_khxx.khbh='"+khbh+"'";
    ls_sql+=" order by cw_jrtcmx.xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		hdlxmc=cf.fillNull(rs.getString("hdlxmc"));
		tckh=cf.fillNull(rs.getString("tckh"));

		dianz=cf.fillNull(rs.getString("dianz"));
		weny=cf.fillNull(rs.getString("weny"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cly=cf.fillNull(rs.getString("cly"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		xqzg=cf.fillNull(rs.getString("xqzg"));
		xqzz=cf.fillNull(rs.getString("xqzz"));
		xqzy=cf.fillNull(rs.getString("xqzy"));
		wlyxzg=cf.fillNull(rs.getString("wlyxzg"));
		yxzy=cf.fillNull(rs.getString("yxzy"));
		wzch=cf.fillNull(rs.getString("wzch"));
		wysj=cf.fillNull(rs.getString("wysj"));
		wzcxy=cf.fillNull(rs.getString("wzcxy"));
		dhzy=cf.fillNull(rs.getString("dhzy"));
		wztgy=cf.fillNull(rs.getString("wztgy"));
		siji=cf.fillNull(rs.getString("siji"));

		fwmj=rs.getInt("fwmj");
		sjf=rs.getDouble("sjf");
		ycf=rs.getDouble("ycf");
		zqje=rs.getDouble("zqje");
		zk=rs.getDouble("zk");
		suijin=rs.getDouble("suijin");
		zhjtjs=rs.getDouble("zhjtjs");
		zjxje=rs.getDouble("zjxje");
		zjxbl=rs.getDouble("zjxbl");
		tcwzczx=rs.getDouble("tcwzczx");
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzqysjftc=rs.getDouble("dzqysjftc");
		dzjssjftc=rs.getDouble("dzjssjftc");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		dzqyzxtc=rs.getDouble("dzqyzxtc");
		dzjszxtc=rs.getDouble("dzjszxtc");
		dztcxj=rs.getDouble("dztcxj");
		dzkhbl=rs.getDouble("dzkhbl");
		dztcze=rs.getDouble("dztcze");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		wyqyzxtc=rs.getDouble("wyqyzxtc");
		wyjszxtc=rs.getDouble("wyjszxtc");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlqysjftc=rs.getDouble("khjlqysjftc");
		khjljssjftc=rs.getDouble("khjljssjftc");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		khjlqyzxtc=rs.getDouble("khjlqyzxtc");
		khjljszxtc=rs.getDouble("khjljszxtc");
		khjltcxj=rs.getDouble("khjltcxj");
		khjlkhbl=rs.getDouble("khjlkhbl");
		khjltcze=rs.getDouble("khjltcze");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjsqysjftc=rs.getDouble("sjsqysjftc");
		sjsjssjftc=rs.getDouble("sjsjssjftc");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsqyzxtc=rs.getDouble("sjsqyzxtc");
		sjsjszxtc=rs.getDouble("sjsjszxtc");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		sjsycftc=rs.getDouble("sjsycftc");
		sjstchj=rs.getDouble("sjstchj");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjqyzxtc=rs.getDouble("zjqyzxtc");
		zjjszxtc=rs.getDouble("zjjszxtc");
		zjycftcbl=rs.getDouble("zjycftcbl");
		zjycftc=rs.getDouble("zjycftc");
		zjtcxj=rs.getDouble("zjtcxj");
		zjkhbl=rs.getDouble("zjkhbl");
		zjtchj=rs.getDouble("zjtchj");
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		clyqyzxtc=rs.getDouble("clyqyzxtc");
		clyjszxtc=rs.getDouble("clyjszxtc");
		clykhbl=rs.getDouble("clykhbl");
		clytc=rs.getDouble("clytc");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzgqyzxtc=rs.getDouble("xqzgqyzxtc");
		xqzgjszxtc=rs.getDouble("xqzgjszxtc");
		xqzgkhbl=rs.getDouble("xqzgkhbl");
		xqzgtc=rs.getDouble("xqzgtc");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzzqyzxtc=rs.getDouble("xqzzqyzxtc");
		xqzzjszxtc=rs.getDouble("xqzzjszxtc");
		xqzzkhbl=rs.getDouble("xqzzkhbl");
		xqzztc=rs.getDouble("xqzztc");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		xqzyqyzxtc=rs.getDouble("xqzyqyzxtc");
		xqzyjszxtc=rs.getDouble("xqzyjszxtc");
		xqzykhbl=rs.getDouble("xqzykhbl");
		xqzytc=rs.getDouble("xqzytc");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		wlyxzgqyzxtc=rs.getDouble("wlyxzgqyzxtc");
		wlyxzgjszxtc=rs.getDouble("wlyxzgjszxtc");
		wlyxzgkhbl=rs.getDouble("wlyxzgkhbl");
		wlyxzgtc=rs.getDouble("wlyxzgtc");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		yxzyqyzxtc=rs.getDouble("yxzyqyzxtc");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wzchqyzxtc=rs.getDouble("wzchqyzxtc");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wysjqyzxtc=rs.getDouble("wysjqyzxtc");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		wzcxyqyzxtc=rs.getDouble("wzcxyqyzxtc");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		dhzyqyzxtc=rs.getDouble("dhzyqyzxtc");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		wztgyqyzxtc=rs.getDouble("wztgyqyzxtc");
		wztgyjszxtc=rs.getDouble("wztgyjszxtc");
		wztgykhbl=rs.getDouble("wztgykhbl");
		wztgytc=rs.getDouble("wztgytc");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
		sjqyzxtc=rs.getDouble("sjqyzxtc");
		jjze=rs.getDouble("jjze");

		lx=cf.fillNull(rs.getString("lx"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jrtcmx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" readonly>  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ص���־</td> 
  <td width="32%"> 
    <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%>
    </select>  </td>
  <td align="right" width="18%">�ײͿͻ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "tckh","1+����&2+�ײ�",tckh);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�곤</td> 
  <td width="32%"> 
    <input type="text" name="dianz" size="20" maxlength="20"  value="<%=dianz%>" >  </td>
  <td align="right" width="18%">��Ա</td> 
  <td width="32%"> 
    <input type="text" name="weny" size="20" maxlength="20"  value="<%=weny%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ҵ��</td> 
  <td width="32%"> 
    <input type="text" name="khjl" size="20" maxlength="20"  value="<%=khjl%>" >  </td>
  <td align="right" width="18%">���ʦ</td> 
  <td width="32%"> 
    <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ա</td> 
  <td width="32%"> 
    <input type="text" name="cly" size="20" maxlength="20"  value="<%=cly%>" >  </td>
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С������</td> 
  <td width="32%"> 
    <input type="text" name="xqzg" size="20" maxlength="20"  value="<%=xqzg%>" >  </td>
  <td align="right" width="18%">С���鳤</td> 
  <td width="32%"> 
    <input type="text" name="xqzz" size="20" maxlength="20"  value="<%=xqzz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С��רԱ</td> 
  <td width="32%"> 
    <input type="text" name="xqzy" size="20" maxlength="20"  value="<%=xqzy%>" >  </td>
  <td align="right" width="18%">����Ӫ������</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzg" size="20" maxlength="20"  value="<%=wlyxzg%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ӫ��רԱ</td> 
  <td width="32%"> 
    <input type="text" name="yxzy" size="20" maxlength="20"  value="<%=yxzy%>" >  </td>
  <td align="right" width="18%">��վ�߻�</td> 
  <td width="32%"> 
    <input type="text" name="wzch" size="20" maxlength="20"  value="<%=wzch%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ҳ���</td> 
  <td width="32%"> 
    <input type="text" name="wysj" size="20" maxlength="20"  value="<%=wysj%>" >  </td>
  <td align="right" width="18%">��վ����Ա</td> 
  <td width="32%"> 
    <input type="text" name="wzcxy" size="20" maxlength="20"  value="<%=wzcxy%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�绰רԱ</td> 
  <td width="32%"> 
    <input type="text" name="dhzy" size="20" maxlength="20"  value="<%=dhzy%>" >  </td>
  <td align="right" width="18%">��վ�ƹ�Ա</td> 
  <td width="32%"> 
    <input type="text" name="wztgy" size="20" maxlength="20"  value="<%=wztgy%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">˾��</td> 
  <td width="32%"> 
    <input type="text" name="siji" size="20" maxlength="20"  value="<%=siji%>" >  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ�</td> 
  <td width="32%"> 
    <input type="text" name="sjf" size="20" maxlength="17"  value="<%=sjf%>" >  </td>
  <td align="right" width="18%">Զ�̷�</td> 
  <td width="32%"> 
    <input type="text" name="ycf" size="20" maxlength="17"  value="<%=ycf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ǰ���</td> 
  <td width="32%"> 
    <input type="text" name="zqje" size="20" maxlength="17"  value="<%=zqje%>" >  </td>
  <td align="right" width="18%">�ۿ�</td> 
  <td width="32%"> 
    <input type="text" name="zk" size="20" maxlength="17"  value="<%=zk%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">˰��</td> 
  <td width="32%"> 
    <input type="text" name="suijin" size="20" maxlength="17"  value="<%=suijin%>" >  </td>
  <td align="right" width="18%">�ۺ�������</td> 
  <td width="32%"> 
    <input type="text" name="zhjtjs" size="20" maxlength="17"  value="<%=zhjtjs%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="zjxje" size="20" maxlength="17"  value="<%=zjxje%>" >  </td>
  <td align="right" width="18%">���������</td> 
  <td width="32%"> 
    <input type="text" name="zjxbl" size="20" maxlength="17"  value="<%=zjxbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײ�����������</td> 
  <td width="32%"> 
    <input type="text" name="tcwzczx" size="20" maxlength="17"  value="<%=tcwzczx%>" >  </td>
  <td align="right" width="18%">�곤��Ʒ���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="dzsjftcbl" size="20" maxlength="17"  value="<%=dzsjftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�곤ǩԼ��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="dzqysjftc" size="20" maxlength="17"  value="<%=dzqysjftc%>" >  </td>
  <td align="right" width="18%">�곤������Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="dzjssjftc" size="20" maxlength="17"  value="<%=dzjssjftc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�곤װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="dzzxftcbl" size="20" maxlength="17"  value="<%=dzzxftcbl%>" >  </td>
  <td align="right" width="18%">�곤ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="dzqyzxtc" size="20" maxlength="17"  value="<%=dzqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�곤����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="dzjszxtc" size="20" maxlength="17"  value="<%=dzjszxtc%>" >  </td>
  <td align="right" width="18%">�곤���С��</td> 
  <td width="32%"> 
    <input type="text" name="dztcxj" size="20" maxlength="17"  value="<%=dztcxj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�곤���˱���</td> 
  <td width="32%"> 
    <input type="text" name="dzkhbl" size="20" maxlength="17"  value="<%=dzkhbl%>" >  </td>
  <td align="right" width="18%">�곤����ܶ�</td> 
  <td width="32%"> 
    <input type="text" name="dztcze" size="20" maxlength="17"  value="<%=dztcze%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Աװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="wyzxftcbl" size="20" maxlength="17"  value="<%=wyzxftcbl%>" >  </td>
  <td align="right" width="18%">��ԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="wyqyzxtc" size="20" maxlength="17"  value="<%=wyqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ա����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="wyjszxtc" size="20" maxlength="17"  value="<%=wyjszxtc%>" >  </td>
  <td align="right" width="18%">����ҵ����Ʒ���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="khjlsjftcbl" size="20" maxlength="17"  value="<%=khjlsjftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ҵ��ǩԼ��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="khjlqysjftc" size="20" maxlength="17"  value="<%=khjlqysjftc%>" >  </td>
  <td align="right" width="18%">����ҵ�������Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="khjljssjftc" size="20" maxlength="17"  value="<%=khjljssjftc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ҵ��װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="khjlzxftcbl" size="20" maxlength="17"  value="<%=khjlzxftcbl%>" >  </td>
  <td align="right" width="18%">����ҵ��ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="khjlqyzxtc" size="20" maxlength="17"  value="<%=khjlqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ҵ�����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="khjljszxtc" size="20" maxlength="17"  value="<%=khjljszxtc%>" >  </td>
  <td align="right" width="18%">����ҵ�����С��</td> 
  <td width="32%"> 
    <input type="text" name="khjltcxj" size="20" maxlength="17"  value="<%=khjltcxj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ҵ�񿼺˱���</td> 
  <td width="32%"> 
    <input type="text" name="khjlkhbl" size="20" maxlength="17"  value="<%=khjlkhbl%>" >  </td>
  <td align="right" width="18%">����ҵ������ܶ�</td> 
  <td width="32%"> 
    <input type="text" name="khjltcze" size="20" maxlength="17"  value="<%=khjltcze%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ��Ʒ���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="sjssjftcbl" size="20" maxlength="17"  value="<%=sjssjftcbl%>" >  </td>
  <td align="right" width="18%">���ʦǩԼ��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="sjsqysjftc" size="20" maxlength="17"  value="<%=sjsqysjftc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ������Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="sjsjssjftc" size="20" maxlength="17"  value="<%=sjsjssjftc%>" >  </td>
  <td align="right" width="18%">���ʦװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="sjszxftcbl" size="20" maxlength="17"  value="<%=sjszxftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="sjsqyzxtc" size="20" maxlength="17"  value="<%=sjsqyzxtc%>" >  </td>
  <td align="right" width="18%">���ʦ����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="sjsjszxtc" size="20" maxlength="17"  value="<%=sjsjszxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦԶ�̷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="sjsycftcbl" size="20" maxlength="17"  value="<%=sjsycftcbl%>" >  </td>
  <td align="right" width="18%">���ʦԶ�̷����</td> 
  <td width="32%"> 
    <input type="text" name="sjsycftc" size="20" maxlength="17"  value="<%=sjsycftc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ��ɺϼ�</td> 
  <td width="32%"> 
    <input type="text" name="sjstchj" size="20" maxlength="17"  value="<%=sjstchj%>" >  </td>
  <td align="right" width="18%">�ͻ�����װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="zjzxftcbl" size="20" maxlength="17"  value="<%=zjzxftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="zjqyzxtc" size="20" maxlength="17"  value="<%=zjqyzxtc%>" >  </td>
  <td align="right" width="18%">�ͻ��������װ�����</td> 
  <td width="32%"> 
    <input type="text" name="zjjszxtc" size="20" maxlength="17"  value="<%=zjjszxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����Զ�̷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="zjycftcbl" size="20" maxlength="17"  value="<%=zjycftcbl%>" >  </td>
  <td align="right" width="18%">�ͻ�����Զ�̷����</td> 
  <td width="32%"> 
    <input type="text" name="zjycftc" size="20" maxlength="17"  value="<%=zjycftc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ��������С��</td> 
  <td width="32%"> 
    <input type="text" name="zjtcxj" size="20" maxlength="17"  value="<%=zjtcxj%>" >  </td>
  <td align="right" width="18%">�ͻ������˱���</td> 
  <td width="32%"> 
    <input type="text" name="zjkhbl" size="20" maxlength="17"  value="<%=zjkhbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�������ɺϼ�</td> 
  <td width="32%"> 
    <input type="text" name="zjtchj" size="20" maxlength="17"  value="<%=zjtchj%>" >  </td>
  <td align="right" width="18%">����Աװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="clyzxftcbl" size="20" maxlength="17"  value="<%=clyzxftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="clyqyzxtc" size="20" maxlength="17"  value="<%=clyqyzxtc%>" >  </td>
  <td align="right" width="18%">����Ա����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="clyjszxtc" size="20" maxlength="17"  value="<%=clyjszxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ա���˱���</td> 
  <td width="32%"> 
    <input type="text" name="clykhbl" size="20" maxlength="17"  value="<%=clykhbl%>" >  </td>
  <td align="right" width="18%">����Ա���</td> 
  <td width="32%"> 
    <input type="text" name="clytc" size="20" maxlength="17"  value="<%=clytc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С������װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="xqzgzxftcbl" size="20" maxlength="17"  value="<%=xqzgzxftcbl%>" >  </td>
  <td align="right" width="18%">С������ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="xqzgqyzxtc" size="20" maxlength="17"  value="<%=xqzgqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С�����ܽ���װ�����</td> 
  <td width="32%"> 
    <input type="text" name="xqzgjszxtc" size="20" maxlength="17"  value="<%=xqzgjszxtc%>" >  </td>
  <td align="right" width="18%">С�����ܿ��˱���</td> 
  <td width="32%"> 
    <input type="text" name="xqzgkhbl" size="20" maxlength="17"  value="<%=xqzgkhbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С���������</td> 
  <td width="32%"> 
    <input type="text" name="xqzgtc" size="20" maxlength="17"  value="<%=xqzgtc%>" >  </td>
  <td align="right" width="18%">С���鳤װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="xqzzzxftcbl" size="20" maxlength="17"  value="<%=xqzzzxftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С���鳤ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="xqzzqyzxtc" size="20" maxlength="17"  value="<%=xqzzqyzxtc%>" >  </td>
  <td align="right" width="18%">С���鳤����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="xqzzjszxtc" size="20" maxlength="17"  value="<%=xqzzjszxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С���鳤���˱���</td> 
  <td width="32%"> 
    <input type="text" name="xqzzkhbl" size="20" maxlength="17"  value="<%=xqzzkhbl%>" >  </td>
  <td align="right" width="18%">С���鳤���</td> 
  <td width="32%"> 
    <input type="text" name="xqzztc" size="20" maxlength="17"  value="<%=xqzztc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С��רԱװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="xqzyzxftcbl" size="20" maxlength="17"  value="<%=xqzyzxftcbl%>" >  </td>
  <td align="right" width="18%">С��רԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="xqzyqyzxtc" size="20" maxlength="17"  value="<%=xqzyqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С��רԱ����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="xqzyjszxtc" size="20" maxlength="17"  value="<%=xqzyjszxtc%>" >  </td>
  <td align="right" width="18%">С��רԱ���˱���</td> 
  <td width="32%"> 
    <input type="text" name="xqzykhbl" size="20" maxlength="17"  value="<%=xqzykhbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С��רԱ���</td> 
  <td width="32%"> 
    <input type="text" name="xqzytc" size="20" maxlength="17"  value="<%=xqzytc%>" >  </td>
  <td align="right" width="18%">����Ӫ������װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzgzxftcbl" size="20" maxlength="17"  value="<%=wlyxzgzxftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ӫ������ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzgqyzxtc" size="20" maxlength="17"  value="<%=wlyxzgqyzxtc%>" >  </td>
  <td align="right" width="18%">����Ӫ�����ܽ���װ�����</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzgjszxtc" size="20" maxlength="17"  value="<%=wlyxzgjszxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ӫ�����ܿ��˱���</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzgkhbl" size="20" maxlength="17"  value="<%=wlyxzgkhbl%>" >  </td>
  <td align="right" width="18%">����Ӫ���������</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzgtc" size="20" maxlength="17"  value="<%=wlyxzgtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ӫ��רԱװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="yxzyzxftcbl" size="20" maxlength="17"  value="<%=yxzyzxftcbl%>" >  </td>
  <td align="right" width="18%">Ӫ��רԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="yxzyqyzxtc" size="20" maxlength="17"  value="<%=yxzyqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ�߻�װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="wzchzxftcbl" size="20" maxlength="17"  value="<%=wzchzxftcbl%>" >  </td>
  <td align="right" width="18%">��վ�߻�ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="wzchqyzxtc" size="20" maxlength="17"  value="<%=wzchqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ҳ���װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="wysjzxftcbl" size="20" maxlength="17"  value="<%=wysjzxftcbl%>" >  </td>
  <td align="right" width="18%">��ҳ���ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="wysjqyzxtc" size="20" maxlength="17"  value="<%=wysjqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ����Աװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="wzcxyzxftcbl" size="20" maxlength="17"  value="<%=wzcxyzxftcbl%>" >  </td>
  <td align="right" width="18%">��վ����ԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="wzcxyqyzxtc" size="20" maxlength="17"  value="<%=wzcxyqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�绰רԱװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="dhzyzxftcbl" size="20" maxlength="17"  value="<%=dhzyzxftcbl%>" >  </td>
  <td align="right" width="18%">�绰רԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="dhzyqyzxtc" size="20" maxlength="17"  value="<%=dhzyqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ�ƹ�Աװ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="wztgyzxftcbl" size="20" maxlength="17"  value="<%=wztgyzxftcbl%>" >  </td>
  <td align="right" width="18%">��վ�ƹ�ԱǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="wztgyqyzxtc" size="20" maxlength="17"  value="<%=wztgyqyzxtc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ�ƹ�Ա����װ�����</td> 
  <td width="32%"> 
    <input type="text" name="wztgyjszxtc" size="20" maxlength="17"  value="<%=wztgyjszxtc%>" >  </td>
  <td align="right" width="18%">��վ�ƹ�Ա���˱���</td> 
  <td width="32%"> 
    <input type="text" name="wztgykhbl" size="20" maxlength="17"  value="<%=wztgykhbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��վ�ƹ�Ա���</td> 
  <td width="32%"> 
    <input type="text" name="wztgytc" size="20" maxlength="17"  value="<%=wztgytc%>" >  </td>
  <td align="right" width="18%">˾��װ�޷���ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="sjzxftcbl" size="20" maxlength="17"  value="<%=sjzxftcbl%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">˾��ǩԼװ�����</td> 
  <td width="32%"> 
    <input type="text" name="sjqyzxtc" size="20" maxlength="17"  value="<%=sjqyzxtc%>" >  </td>
  <td align="right" width="18%">�����ܶ�</td> 
  <td width="32%"> 
    <input type="text" name="jjze" size="20" maxlength="17"  value="<%=jjze%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "lx","1+ǩ�����&2+�������",lx);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right">¼��ʱ��</td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("������[��������]��");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}
	if(	!radioChecked(FormName.tckh)) {
		alert("��ѡ��[�ײͿͻ�]��");
		FormName.tckh[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[�������]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqje)=="") {
		alert("������[��ǰ���]��");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "��ǰ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zk)=="") {
		alert("������[�ۿ�]��");
		FormName.zk.focus();
		return false;
	}
	if(!(isFloat(FormName.zk, "�ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("������[˰��]��");
		FormName.suijin.focus();
		return false;
	}
	if(!(isFloat(FormName.suijin, "˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.zhjtjs)=="") {
		alert("������[�ۺ�������]��");
		FormName.zhjtjs.focus();
		return false;
	}
	if(!(isFloat(FormName.zhjtjs, "�ۺ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxbl)=="") {
		alert("������[���������]��");
		FormName.zjxbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxbl, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.tcwzczx)=="") {
		alert("������[�ײ�����������]��");
		FormName.tcwzczx.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwzczx, "�ײ�����������"))) {
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("������[�곤��Ʒ���ɱ���]��");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "�곤��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dzqysjftc)=="") {
		alert("������[�곤ǩԼ��Ʒ����]��");
		FormName.dzqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzqysjftc, "�곤ǩԼ��Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dzjssjftc)=="") {
		alert("������[�곤������Ʒ����]��");
		FormName.dzjssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzjssjftc, "�곤������Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("������[�곤װ�޷���ɱ���]��");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "�곤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dzqyzxtc)=="") {
		alert("������[�곤ǩԼװ�����]��");
		FormName.dzqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzqyzxtc, "�곤ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dzjszxtc)=="") {
		alert("������[�곤����װ�����]��");
		FormName.dzjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzjszxtc, "�곤����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dztcxj)=="") {
		alert("������[�곤���С��]��");
		FormName.dztcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.dztcxj, "�곤���С��"))) {
		return false;
	}
	if(	javaTrim(FormName.dzkhbl)=="") {
		alert("������[�곤���˱���]��");
		FormName.dzkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzkhbl, "�곤���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.dztcze)=="") {
		alert("������[�곤����ܶ�]��");
		FormName.dztcze.focus();
		return false;
	}
	if(!(isFloat(FormName.dztcze, "�곤����ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("������[��Աװ�޷���ɱ���]��");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "��Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wyqyzxtc)=="") {
		alert("������[��ԱǩԼװ�����]��");
		FormName.wyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wyqyzxtc, "��ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wyjszxtc)=="") {
		alert("������[��Ա����װ�����]��");
		FormName.wyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wyjszxtc, "��Ա����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("������[����ҵ����Ʒ���ɱ���]��");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "����ҵ����Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlqysjftc)=="") {
		alert("������[����ҵ��ǩԼ��Ʒ����]��");
		FormName.khjlqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlqysjftc, "����ҵ��ǩԼ��Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjljssjftc)=="") {
		alert("������[����ҵ�������Ʒ����]��");
		FormName.khjljssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjljssjftc, "����ҵ�������Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("������[����ҵ��װ�޷���ɱ���]��");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "����ҵ��װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlqyzxtc)=="") {
		alert("������[����ҵ��ǩԼװ�����]��");
		FormName.khjlqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlqyzxtc, "����ҵ��ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjljszxtc)=="") {
		alert("������[����ҵ�����װ�����]��");
		FormName.khjljszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjljszxtc, "����ҵ�����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjltcxj)=="") {
		alert("������[����ҵ�����С��]��");
		FormName.khjltcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.khjltcxj, "����ҵ�����С��"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlkhbl)=="") {
		alert("������[����ҵ�񿼺˱���]��");
		FormName.khjlkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlkhbl, "����ҵ�񿼺˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjltcze)=="") {
		alert("������[����ҵ������ܶ�]��");
		FormName.khjltcze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjltcze, "����ҵ������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("������[���ʦ��Ʒ���ɱ���]��");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "���ʦ��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsqysjftc)=="") {
		alert("������[���ʦǩԼ��Ʒ����]��");
		FormName.sjsqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsqysjftc, "���ʦǩԼ��Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsjssjftc)=="") {
		alert("������[���ʦ������Ʒ����]��");
		FormName.sjsjssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsjssjftc, "���ʦ������Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("������[���ʦװ�޷���ɱ���]��");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "���ʦװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsqyzxtc)=="") {
		alert("������[���ʦǩԼװ�����]��");
		FormName.sjsqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsqyzxtc, "���ʦǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsjszxtc)=="") {
		alert("������[���ʦ����װ�����]��");
		FormName.sjsjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsjszxtc, "���ʦ����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("������[���ʦԶ�̷���ɱ���]��");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "���ʦԶ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftc)=="") {
		alert("������[���ʦԶ�̷����]��");
		FormName.sjsycftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftc, "���ʦԶ�̷����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjstchj)=="") {
		alert("������[���ʦ��ɺϼ�]��");
		FormName.sjstchj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjstchj, "���ʦ��ɺϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("������[�ͻ�����װ�޷���ɱ���]��");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "�ͻ�����װ�޷���ɱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.zjqyzxtc, "�ͻ�����ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjjszxtc)=="") {
		alert("������[�ͻ��������װ�����]��");
		FormName.zjjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.zjjszxtc, "�ͻ��������װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("������[�ͻ�����Զ�̷���ɱ���]��");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "�ͻ�����Զ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftc)=="") {
		alert("������[�ͻ�����Զ�̷����]��");
		FormName.zjycftc.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftc, "�ͻ�����Զ�̷����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjtcxj)=="") {
		alert("������[�ͻ��������С��]��");
		FormName.zjtcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.zjtcxj, "�ͻ��������С��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjkhbl)=="") {
		alert("������[�ͻ������˱���]��");
		FormName.zjkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjkhbl, "�ͻ������˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjtchj)=="") {
		alert("������[�ͻ�������ɺϼ�]��");
		FormName.zjtchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zjtchj, "�ͻ�������ɺϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("������[����Աװ�޷���ɱ���]��");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clyqyzxtc)=="") {
		alert("������[����ԱǩԼװ�����]��");
		FormName.clyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.clyqyzxtc, "����ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.clyjszxtc)=="") {
		alert("������[����Ա����װ�����]��");
		FormName.clyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.clyjszxtc, "����Ա����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.clykhbl)=="") {
		alert("������[����Ա���˱���]��");
		FormName.clykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clykhbl, "����Ա���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.clytc)=="") {
		alert("������[����Ա���]��");
		FormName.clytc.focus();
		return false;
	}
	if(!(isFloat(FormName.clytc, "����Ա���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("������[С������װ�޷���ɱ���]��");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "С������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgqyzxtc)=="") {
		alert("������[С������ǩԼװ�����]��");
		FormName.xqzgqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgqyzxtc, "С������ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgjszxtc)=="") {
		alert("������[С�����ܽ���װ�����]��");
		FormName.xqzgjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgjszxtc, "С�����ܽ���װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgkhbl)=="") {
		alert("������[С�����ܿ��˱���]��");
		FormName.xqzgkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgkhbl, "С�����ܿ��˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgtc)=="") {
		alert("������[С���������]��");
		FormName.xqzgtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgtc, "С���������"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("������[С���鳤װ�޷���ɱ���]��");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "С���鳤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzqyzxtc)=="") {
		alert("������[С���鳤ǩԼװ�����]��");
		FormName.xqzzqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzqyzxtc, "С���鳤ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzjszxtc)=="") {
		alert("������[С���鳤����װ�����]��");
		FormName.xqzzjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzjszxtc, "С���鳤����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzkhbl)=="") {
		alert("������[С���鳤���˱���]��");
		FormName.xqzzkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzkhbl, "С���鳤���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzztc)=="") {
		alert("������[С���鳤���]��");
		FormName.xqzztc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzztc, "С���鳤���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("������[С��רԱװ�޷���ɱ���]��");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "С��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyqyzxtc)=="") {
		alert("������[С��רԱǩԼװ�����]��");
		FormName.xqzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyqyzxtc, "С��רԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyjszxtc)=="") {
		alert("������[С��רԱ����װ�����]��");
		FormName.xqzyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyjszxtc, "С��רԱ����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzykhbl)=="") {
		alert("������[С��רԱ���˱���]��");
		FormName.xqzykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzykhbl, "С��רԱ���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzytc)=="") {
		alert("������[С��רԱ���]��");
		FormName.xqzytc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzytc, "С��רԱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("������[����Ӫ������װ�޷���ɱ���]��");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "����Ӫ������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgqyzxtc)=="") {
		alert("������[����Ӫ������ǩԼװ�����]��");
		FormName.wlyxzgqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgqyzxtc, "����Ӫ������ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgjszxtc)=="") {
		alert("������[����Ӫ�����ܽ���װ�����]��");
		FormName.wlyxzgjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgjszxtc, "����Ӫ�����ܽ���װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgkhbl)=="") {
		alert("������[����Ӫ�����ܿ��˱���]��");
		FormName.wlyxzgkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgkhbl, "����Ӫ�����ܿ��˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgtc)=="") {
		alert("������[����Ӫ���������]��");
		FormName.wlyxzgtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgtc, "����Ӫ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("������[Ӫ��רԱװ�޷���ɱ���]��");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "Ӫ��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyqyzxtc)=="") {
		alert("������[Ӫ��רԱǩԼװ�����]��");
		FormName.yxzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyqyzxtc, "Ӫ��רԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("������[��վ�߻�װ�޷���ɱ���]��");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "��վ�߻�װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchqyzxtc)=="") {
		alert("������[��վ�߻�ǩԼװ�����]��");
		FormName.wzchqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchqyzxtc, "��վ�߻�ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("������[��ҳ���װ�޷���ɱ���]��");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "��ҳ���װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjqyzxtc)=="") {
		alert("������[��ҳ���ǩԼװ�����]��");
		FormName.wysjqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjqyzxtc, "��ҳ���ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("������[��վ����Աװ�޷���ɱ���]��");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "��վ����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyqyzxtc)=="") {
		alert("������[��վ����ԱǩԼװ�����]��");
		FormName.wzcxyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyqyzxtc, "��վ����ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("������[�绰רԱװ�޷���ɱ���]��");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "�绰רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyqyzxtc)=="") {
		alert("������[�绰רԱǩԼװ�����]��");
		FormName.dhzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyqyzxtc, "�绰רԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("������[��վ�ƹ�Աװ�޷���ɱ���]��");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "��վ�ƹ�Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyqyzxtc)=="") {
		alert("������[��վ�ƹ�ԱǩԼװ�����]��");
		FormName.wztgyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyqyzxtc, "��վ�ƹ�ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyjszxtc)=="") {
		alert("������[��վ�ƹ�Ա����װ�����]��");
		FormName.wztgyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyjszxtc, "��վ�ƹ�Ա����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgykhbl)=="") {
		alert("������[��վ�ƹ�Ա���˱���]��");
		FormName.wztgykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgykhbl, "��վ�ƹ�Ա���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgytc)=="") {
		alert("������[��վ�ƹ�Ա���]��");
		FormName.wztgytc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgytc, "��վ�ƹ�Ա���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("������[˾��װ�޷���ɱ���]��");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "˾��װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjqyzxtc)=="") {
		alert("������[˾��ǩԼװ�����]��");
		FormName.sjqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjqyzxtc, "˾��ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jjze)=="") {
		alert("������[�����ܶ�]��");
		FormName.jjze.focus();
		return false;
	}
	if(!(isFloat(FormName.jjze, "�����ܶ�"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
