<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String sqsj=null;
String sqr=null;
String wcbz=null;
String wcsj=null;
String wcr=null;
String yjjzsj=null;

double gxqwdzgce=0;
double gxqzkl=0;
double gxqqye=0;

double gxqzqgczjf=0;
double gxqzhgczjf=0;
double gxqcdzwjmje=0;

double gxqglfbfb=0;
double gxqzqguanlif=0;
double gxqguanlif=0;
double gxqglfjmje=0;

double gxqsuijinbfb=0;
double gxqzqsuijin=0;
double gxqsuijin=0;
double gxqsjjmje=0;

double gxqzqsjf=0;
double gxqsjf=0;

double gxqzqwjrqyexm=0;
double gxqzhwjrqyexm=0;
String gxqwjrqyexmsm=null;

double gxqzqqtsf=0;
double gxqzhqtsf=0;
String gxqqtsfsm=null;

double gxqhdzsjz=0;
double gxqdjjbfb=0;
double gxqdjjje=0;


double gxhwdzgce=0;
double gxhzkl=0;
double gxhqye=0;

double gxhzqgczjf=0;
double gxhzhgczjf=0;
double gxhcdzwjmje=0;

double gxhglfbfb=0;
double gxhzqguanlif=0;
double gxhguanlif=0;
double gxhglfjmje=0;

double gxhsuijinbfb=0;
double gxhzqsuijin=0;
double gxhsuijin=0;
double gxhsjjmje=0;

double gxhzqsjf=0;
double gxhsjf=0;

double gxhzqwjrqyexm=0;
double gxhzhwjrqyexm=0;
String gxhwjrqyexmsm=null;

double gxhzqqtsf=0;
double gxhzhqtsf=0;
String gxhqtsfsm=null;

double gxhhdzsjz=0;
double gxhdjjbfb=0;
double gxhdjjje=0;

double gxhhtjz=0;
double gxhmll=0;
double gxhcbj=0;
double gxhsgcbj=0;
double gxhgcjcbj=0;
double gxhmle=0;
double gxhyjjzcs=0;
double gxhyjjz=0;

double gxqzqhtzcbj=0;
double gxqzhhtzcbj=0;
double gxqdjfxje=0;
double gxqzjjmje=0;

double gxhzqhtzcbj=0;
double gxhzhhtzcbj=0;
double gxhdjfxje=0;
double gxhzjjmje=0;

String bz=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String bjjb=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String zt=null;
String gcjdbm=null;
String fgsbh=null;
String dwbh=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String smhtbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sqsj,fgsbh,sqr,wcbz,wcsj,wcr,yjjzsj,bz ";
	ls_sql+=" ,gxqwdzgce,gxqzkl,gxqqye  ,gxqhdzsjz,gxqdjjbfb,gxqdjjje   ,gxqzqgczjf,gxqzhgczjf,gxqcdzwjmje  ,gxqglfbfb,gxqzqguanlif,gxqguanlif,gxqglfjmje  ,gxqsuijinbfb,gxqzqsuijin,gxqsuijin,gxqsjjmje  ,gxqzqsjf,gxqsjf  ,gxqzqwjrqyexm,gxqzhwjrqyexm,gxqwjrqyexmsm   ,gxqzqqtsf,gxqzhqtsf,gxqqtsfsm";
	ls_sql+=" ,gxqzqhtzcbj,gxqzhhtzcbj,gxqdjfxje,gxqzjjmje";
	ls_sql+=" ,gxhcdzwjmje,gxhglfjmje,gxhsjjmje";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where khbh='"+khbh+"' and  wcbz='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqr=cf.fillNull(rs.getString("sqr"));
		wcbz=cf.fillNull(rs.getString("wcbz"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		wcr=cf.fillNull(rs.getString("wcr"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		bz=cf.fillNull(rs.getString("bz"));
		
		gxqwdzgce=rs.getDouble("gxqwdzgce");
		gxqzkl=rs.getDouble("gxqzkl");
		gxqqye=rs.getDouble("gxqqye");

		gxqhdzsjz=rs.getDouble("gxqhdzsjz");
		gxqdjjbfb=rs.getDouble("gxqdjjbfb");
		gxqdjjje=rs.getDouble("gxqdjjje");

		gxqzqgczjf=rs.getDouble("gxqzqgczjf");
		gxqzhgczjf=rs.getDouble("gxqzhgczjf");
		gxqcdzwjmje=rs.getDouble("gxqcdzwjmje");

		gxqglfbfb=rs.getDouble("gxqglfbfb");
		gxqzqguanlif=rs.getDouble("gxqzqguanlif");
		gxqguanlif=rs.getDouble("gxqguanlif");
		gxqglfjmje=rs.getDouble("gxqglfjmje");


		gxqsuijinbfb=rs.getDouble("gxqsuijinbfb");
		gxqzqsuijin=rs.getDouble("gxqzqsuijin");
		gxqsuijin=rs.getDouble("gxqsuijin");
		gxqsjjmje=rs.getDouble("gxqsjjmje");

		gxqzqsjf=rs.getDouble("gxqzqsjf");
		gxqsjf=rs.getDouble("gxqsjf");

		gxqzqwjrqyexm=rs.getDouble("gxqzqwjrqyexm");
		gxqzhwjrqyexm=rs.getDouble("gxqzhwjrqyexm");
		gxqwjrqyexmsm=cf.fillNull(rs.getString("gxqwjrqyexmsm"));

		gxqzqqtsf=rs.getDouble("gxqzqqtsf");
		gxqzhqtsf=rs.getDouble("gxqzhqtsf");
		gxqqtsfsm=cf.fillNull(rs.getString("gxqqtsfsm"));

		gxqhdzsjz=rs.getDouble("gxqhdzsjz");
		gxqdjjbfb=rs.getDouble("gxqdjjbfb");
		gxqdjjje=rs.getDouble("gxqdjjje");

		gxqzqhtzcbj=rs.getDouble("gxqzqhtzcbj");
		gxqzhhtzcbj=rs.getDouble("gxqzhhtzcbj");
		gxqdjfxje=rs.getDouble("gxqdjfxje");
		gxqzjjmje=rs.getDouble("gxqzjjmje");

		gxhcdzwjmje=rs.getDouble("gxhcdzwjmje");
		gxhglfjmje=rs.getDouble("gxhglfjmje");
		gxhsjjmje=rs.getDouble("gxhsjjmje");
	}
	rs.close();
	ps.close();

	ls_sql="select bjjb,smhtbh,hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,zjxm,kgrq,jgrq,sjkgrq,sjjgrq,zt,gcjdbm,fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT yjjzcs";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gxhyjjzcs=rs.getDouble("yjjzcs");
	}
	rs.close();
	ps.close();

	if (gxhyjjzcs==0)
	{
		out.println("����δ�衾ҵ����ֵ������");
		return;
	}



////////////////
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();

	gxhwdzgce=dzbjje.getZqBjje(conn,khbh,"yz");//��ȡ����ǰ�����ӱ��۽�ֱ�ӷѣ������շ�
	gxhqye=dzbjje.getZhBjje(conn,khbh,"sxyd")-gxhsjjmje-gxhglfjmje-gxhcdzwjmje;//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շ�

	gxhsuijinbfb=dzbjje.getSuijinBfb(conn,khbh,"yz");//˰��ٷֱ�
	gxhsuijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//��ȡ�ۺ�˰���
	gxhzqsuijin=dzbjje.getZqSuijinJe(conn,khbh,"yz")-gxhsjjmje;//��ȡ��ǰ��˰���

	gxhglfbfb=dzbjje.getGlfBl(conn,khbh,"yz");//����Ѱٷֱ�
	gxhzqguanlif=dzbjje.getZqGlfJe(conn,khbh,"yz");//����ǰ�������
	gxhguanlif=dzbjje.getZhGlfJe(conn,khbh,"yz")-gxhglfjmje;//��ȡ�ۺ󡺹���ѽ�

	gxhzqgczjf=dzbjje.getZqGczjf(conn,khbh,"yz");//����ֱ�ӷѣ���ǰ
	gxhzhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz")-gxhcdzwjmje;//����ֱ�ӷѣ��ۺ�

	gxhzqqtsf=dzbjje.getZqJrQtsf(conn,khbh,"yz");//����ҵ�������ѣ���ǰ��������˰�𡢹���ѡ���Ʒ�
	gxhzhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//����ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�
	gxhqtsfsm=dzbjje.getJrQtsfsm(conn,khbh,"yz");//����ҵ����������Ŀ��������˰�𡢹���ѡ���Ʒ�

	gxhzqwjrqyexm=dzbjje.getZqWjrJe(conn,khbh);//��ȡ��ǰ��������ҵ�������ѡ���������˰�𡢹���ѡ���Ʒ�
	gxhzhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh);//��ȡ�ۺ󡺲�����ҵ�������ѡ���������˰�𡢹���ѡ���Ʒ�
	gxhwjrqyexmsm=dzbjje.getWjrJeMc(conn,khbh);//��ȡ�������շ���Ŀ���ơ���������˰�𡢹���ѡ���Ʒ�

	gxhzqsjf=dzbjje.getZqSjf(conn,khbh);//��ȡ��ǰ����Ʒѡ�
	gxhsjf=dzbjje.getZhSjf(conn,khbh);//��ȡ�ۺ���Ʒѡ�

	gxhzqhtzcbj=dzbjje.getZqZcbj(conn,khbh,"yz");//��ͬ���ı��ۣ���ǰ
	gxhzhhtzcbj=dzbjje.getZhZcbj(conn,khbh,"yz");//��ͬ���ı��ۣ��ۺ�


	if (gxhwdzgce!=0)
	{
		gxhzkl=cf.round(gxhqye*10/gxhwdzgce,2);
	}
	else{
		gxhzkl=10;
	}


	gxhdjfxje=dzbjje.getDjfxje(conn,khbh,"sxyd");//�����ֽ��
	gxhzjjmje=dzbjje.getZjjmje(conn,khbh,"yz");//ֱ�Ӽ�����
	gxhhdzsjz=dzbjje.getZsjz(conn,khbh);//����;�ֵ+��Ȩ���;�ֵ


	gxhdjjje=dzbjje.getHtDjj(conn,khbh,"yz");//����ȯ���
	gxhdjjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//����ȯ�ٷֱ�


	gxhhtjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ

	gxhsgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
	
	gxhmle=cf.round(gxhhtjz-gxhsgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
	gxhmll=cf.round(gxhmle/gxhhtjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ

	gxhyjjz=cf.round((gxhmle-gxhzhwjrqyexm)*100/gxhyjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

	gxhcbj=dzbjje.getCbj(conn,khbh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
	gxhgcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��

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
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE3 {color: #0000CC; font-size: 12px; }
.STYLE4 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_czbjsqjl.jsp" name="editform" target="_blank">
  <div align="center">�������ۣ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">�ͻ����</font>      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">��ͬ��</font>      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">�ͻ�����</font>      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">ǩԼ����</font>      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">���ʦ</font>      </td>
      <td width="32%"> <%=sjs%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">���̵���</font>      </td>
      <td width="32%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">ʩ����</font>      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">ʩ������</font>      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">��˾�����</font></td>
      <td colspan="3"><%=cxhdbm%>
       <input name="button3" type="button" onClick="window.open('/dhzx/dhzx/zkzsxx.jsp?khbh=<%=khbh%>')" value="�ۿ�����"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">С�������</font></td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">չ������</font></td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>�µ������ͬ���</td>
      <td><input type="text" name="smhtbh" size="20" maxlength="20"  value="<%=smhtbh%>"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��Ȩ��</td>
      <td width="32%"><%=sqr%> </td>
      <td align="right" width="18%">��Ȩʱ��</td>
      <td width="32%"><%=sqsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">�����</font></td>
      <td width="32%"> 
      <input type="text" name="wcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">���ʱ��</font></td>
      <td width="32%"> 
      <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="20" colspan="2" align="center" bgcolor="#E8E8FF"><strong><font color="#990000">����ǰ</font></strong></td>
      <td colspan="2" align="center" bgcolor="#FFFF99"><strong><font color="#990000">���º�</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">��ͬ�ܶ��ǰ</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqwdzgce%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">��ͬ�ܶ��ǰ</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
      <input type="text" name="gxhwdzgce" size="20" maxlength="17"  value="<%=gxhwdzgce%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">�ۺ��ۿ�</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqzkl%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">�ۺ��ۿ�</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
        <input type="text" name="gxhzkl" size="10" maxlength="9"  value="<%=gxhzkl%>" readonly>
      <b><font color="#0000FF">��>0��<=10��</font></b> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">��ͬ�ܶ�ۺ�</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqqye%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">��ͬ�ܶ�ۺ�</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
      <input type="text" name="gxhqye" size="20" maxlength="17"  value="<%=gxhqye%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">���;�ֵ</font></td>
      <td bgcolor="#E8E8FF"><%=gxqhdzsjz%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#0000CC">���;�ֵ</font></td>
      <td bgcolor="#FFFF99"><input name="gxhhdzsjz" type="text" value="<%=gxhhdzsjz%>" size="20" maxlength="16" readonly /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">����ȯ�ٷֱ�</span></td>
      <td bgcolor="#E8E8FF"><%=gxqdjjbfb%> %</td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><span class="STYLE1">����ȯ�ٷֱ�</span></td>
      <td bgcolor="#FFFF99"><input name="gxhdjjbfb" type="text" value="<%=gxhdjjbfb%>" size="10" maxlength="16" readonly="readonly">
%</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">���ʹ���ȯ</font></td>
      <td bgcolor="#E8E8FF"><%=gxqdjjje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000CC">���ʹ���ȯ</font></td>
      <td bgcolor="#FFFF99"><input name="gxhdjjje" type="text" value="<%=gxhdjjje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">�����ֽ��</span></td>
      <td bgcolor="#E8E8FF"><%=gxqdjfxje%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">�����ֽ��</span></td>
      <td bgcolor="#FFFF99"><input name="gxhdjfxje" type="text" value="<%=gxhdjfxje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">ֱ�Ӽ�����</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzjjmje%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">ֱ�Ӽ�����</span></td>
      <td bgcolor="#FFFF99"><input name="gxhzjjmje" type="text" value="<%=gxhzjjmje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqgczjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzqgczjf" type="text" value="<%=gxhzqgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">���̷Ѽ����</span></td>
      <td bgcolor="#E8E8FF"><%=gxqcdzwjmje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font>���̷Ѽ����</td>
      <td bgcolor="#FFFF99"><input name="gxhcdzwjmje" type="text"  value="<%=gxhcdzwjmje%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzhgczjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzhgczjf" type="text" value="<%=gxhzhgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">����Ѱٷֱ�</font></td>
      <td bgcolor="#E8E8FF"><%=gxqglfbfb%>% </td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">����Ѱٷֱ�</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhglfbfb" size="10" maxlength="9"  value="<%=gxhglfbfb%>" readonly>
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">��ǰ�����</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqguanlif%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">��ǰ�����</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzqguanlif" size="20" maxlength="17"  value="<%=gxhzqguanlif%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">����Ѽ����</font></td>
      <td bgcolor="#E8E8FF"><%=gxqglfjmje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font>����Ѽ����</td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhglfjmje" size="20" maxlength="17"  value="<%=gxhglfjmje%>" onChange="calValue(editform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">�ۺ�����</font></td>
      <td bgcolor="#E8E8FF"><%=gxqguanlif%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">�ۺ�����</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhguanlif" size="20" maxlength="17"  value="<%=gxhguanlif%>" readonly>      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">˰��ٷֱ�</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqsuijinbfb%>% </td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">˰��ٷֱ�</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
        <input type="text" name="gxhsuijinbfb" size="10" maxlength="9"  value="<%=gxhsuijinbfb%>" readonly>
      % </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">˰����ǰ</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzqsuijin%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE1"><font color="#CC0000">*</font>˰����ǰ</span></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzqsuijin" size="20" maxlength="17"  value="<%=gxhzqsuijin%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">˰������</font></td>
      <td bgcolor="#E8E8FF"><%=gxqsjjmje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font>˰������</td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhsjjmje" size="20" maxlength="17"  value="<%=gxhsjjmje%>" onChange="calValue(editform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">˰���ۺ�</span></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqsuijin%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><span class="STYLE1">˰���ۺ�</span></td>
      <td width="32%" bgcolor="#FFFF99"> 
      <input type="text" name="gxhsuijin" size="20" maxlength="17"  value="<%=gxhsuijin%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqqtsf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzqqtsf" type="text" value="<%=gxhzqqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ҵ�������ѣ��ۺ�</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzhqtsf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">����ҵ�������ѣ��ۺ�</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzhqtsf" type="text" value="<%=gxhzhqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td rowspan="2" align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ҵ����������Ŀ</font></td>
      <td colspan="3" bgcolor="#E8E8FF"><%=gxqqtsfsm%><span class="STYLE3">������ǰ��</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="3" bgcolor="#FFFF99"><input name="gxhqtsfsm" type="text" value="<%=gxhqtsfsm%>" size="67" maxlength="100" readonly >
      <span class="STYLE3">�����º�</span></td>
    </tr>

    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqwjrqyexm%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzqwjrqyexm" size="20" maxlength="17"  value="<%=gxhzqwjrqyexm%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ҵ�������ѣ��ۺ�</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzhwjrqyexm%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">����ҵ�������ѣ��ۺ�</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzhwjrqyexm" size="20" maxlength="17"  value="<%=gxhzhwjrqyexm%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td rowspan="2" align="right" bgcolor="#E8E8FF"><font color="#0000FF">����ҵ����������Ŀ</font></td>
      <td colspan="3" bgcolor="#E8E8FF"><%=gxqwjrqyexmsm%><span class="STYLE1">������ǰ��</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="3" bgcolor="#FFFF99"><input type="text" name="gxhwjrqyexmsm" size="67" maxlength="100"  value="<%=gxhwjrqyexmsm%>" readonly>
      <span class="STYLE3">�����º�</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">���ı��ۣ���ǰ</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzqhtzcbj%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">���ı��ۣ���ǰ</span></td>
      <td bgcolor="#FFFF99"><input name="gxhzqhtzcbj" type="text" value="<%=gxhzqhtzcbj%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">���ı��ۣ��ۺ�</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzhhtzcbj%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">���ı��ۣ��ۺ�</span></td>
      <td bgcolor="#FFFF99"><input name="gxhzhhtzcbj" type="text" value="<%=gxhzhhtzcbj%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">��Ʒѣ���ǰ</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqsjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ���ǰ</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzqsjf" type="text" value="<%=gxhzqsjf%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ��ۺ�</font></td>
      <td bgcolor="#E8E8FF"><%=gxqsjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ��ۺ�</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhsjf" size="20" maxlength="17"  value="<%=gxhsjf%>" readonly>      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center" > 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="sqsj"  value="<%=sqsj%>" >
          <input type="button"  value="�����������" onClick="f_do(editform)">
          <input type="reset"  value="����">
          <input name="gxhhtjz" type="hidden" value="<%=gxhhtjz%>" size="20" maxlength="16" readonly >
          <input name="gxhsgcbj" type="hidden" value="<%=gxhsgcbj%>" size="20" maxlength="16" readonly >
          <input name="gxhmle" type="hidden" value="<%=gxhmle%>" size="20" maxlength="16" readonly >
          <input name="gxhmll" type="hidden" value="<%=gxhmll%>" size="8" maxlength="8" readonly>
          <input name="gxhyjjzcs" type="hidden" value="<%=gxhyjjzcs%>" size="8" maxlength="8" readonly>
          <input name="gxhyjjz" type="hidden" value="<%=gxhyjjz%>" size="20" maxlength="16" readonly >
          <input name="gxhcbj" type="hidden" value="<%=gxhcbj%>" size="20" maxlength="16" readonly >
          <input name="gxhgcjcbj" type="hidden" value="<%=gxhgcjcbj%>" size="20" maxlength="16" readonly ></td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	//���̷Ѽ����
	var gxhzhgczjf=<%=gxhzhgczjf%>-FormName.gxhcdzwjmje.value*1.0;
	gxhzhgczjf=round(gxhzhgczjf,2);
	FormName.gxhzhgczjf.value=gxhzhgczjf;

	//����Ѽ����
	var gxhguanlif=<%=gxhguanlif%>-FormName.gxhglfjmje.value*1.0;
	gxhguanlif=round(gxhguanlif,2);
	FormName.gxhguanlif.value=gxhguanlif;

	//˰������
	var gxhsuijin=<%=gxhsuijin%>-FormName.gxhsjjmje.value*1.0;
	gxhsuijin=round(gxhsuijin,2);
	FormName.gxhsuijin.value=gxhsuijin;

	//�ۺ��ͬ�ܶ�=�ۺ󹤳�ֱ�ӷѣ��ۺ����ѣ��ۺ�˰���ۺ����ҵ�������ѣ��ۺ󲻼�ҵ�������ѣ��ۺ���Ʒ�
	var gxhqye=FormName.gxhzhgczjf.value*1.0+FormName.gxhguanlif.value*1.0+FormName.gxhsuijin.value*1.0+FormName.gxhzhqtsf.value*1.0+FormName.gxhzhwjrqyexm.value*1.0+FormName.gxhsjf.value*1.0+FormName.gxhzhhtzcbj.value*1.0-FormName.gxhdjfxje.value*1.0-FormName.gxhzjjmje.value*1.0;
	gxhqye=round(gxhqye,2);
	FormName.gxhqye.value=gxhqye;    

	//�ۺ��ۿ�
	var gxhzkl=0;
	if (FormName.gxhwdzgce.value*1!=0)
	{
		gxhzkl=FormName.gxhqye.value*10.0/FormName.gxhwdzgce.value;
	}
	else{
		gxhzkl=10;
	}
	gxhzkl=round(gxhzkl,2);
	FormName.gxhzkl.value=gxhzkl;    


	//��ͬ��ֵ=��ͬ��ֵ�����̷Ѽ�������Ѽ���˰������
	var gxhhtjz=<%=gxhhtjz%>-FormName.gxhcdzwjmje.value*1.0-FormName.gxhglfjmje.value*1.0-FormName.gxhsjjmje.value*1.0;
	gxhhtjz=round(gxhhtjz,2);
	FormName.gxhhtjz.value=gxhhtjz;    

	//ë����=��ͬ��ֵ��ʩ���ɱ���
	var gxhmle=(FormName.gxhhtjz.value*1.0-FormName.gxhsgcbj.value*1.0);
	gxhmle=round(gxhmle,2);
	FormName.gxhmle.value=gxhmle;    

	//ë����=ë����º�ͬ��ֵ
	var gxhmll=FormName.gxhmle.value*1.0/FormName.gxhhtjz.value*1.0*100;
	gxhmll=round(gxhmll,2);
	FormName.gxhmll.value=gxhmll;    

	//ҵ����ֵ=ë�����ҵ����ֵ����
	var gxhyjjz=FormName.gxhmle.value*100/FormName.gxhyjjzcs.value;
	gxhyjjz=round(gxhyjjz,2);
	FormName.gxhyjjz.value=gxhyjjz;    

}
	
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("������[�µ������ͬ���]��");
		FormName.smhtbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wcr)=="") {
		alert("������[�����]��");
		FormName.wcr.focus();
		return false;
	}
	if(	javaTrim(FormName.wcsj)=="") {
		alert("������[���ʱ��]��");
		FormName.wcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "���ʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.gxhwdzgce)=="") {
		alert("������[���º���ǰ��ͬ�ܶ�]��");
		FormName.gxhwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhwdzgce, "���º���ǰ��ͬ�ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzkl)=="") {
		alert("������[���º��ۺ��ۿ�]��");
		FormName.gxhzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzkl, "���º��ۺ��ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhqye)=="") {
		alert("������[���º��ۺ��ͬ�ܶ�]��");
		FormName.gxhqye.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhqye, "���º��ۺ��ͬ�ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhhdzsjz)=="") {
		alert("������[���º����;�ֵ]��");
		FormName.gxhhdzsjz.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhhdzsjz, "���º����;�ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhdjjbfb)=="") {
		alert("������[���º����ȯ�ٷֱ�]��");
		FormName.gxhdjjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhdjjbfb, "���º����ȯ�ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhdjjje)=="") {
		alert("������[���º����ʹ���ȯ]��");
		FormName.gxhdjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhdjjje, "���º����ʹ���ȯ"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqgczjf)=="") {
		alert("������[���º���ǰ����ֱ�ӷ�]��");
		FormName.gxhzqgczjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqgczjf, "���º���ǰ����ֱ�ӷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzhgczjf)=="") {
		alert("������[���º��ۺ󹤳�ֱ�ӷ�]��");
		FormName.gxhzhgczjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzhgczjf, "���º��ۺ󹤳�ֱ�ӷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhcdzwjmje)=="") {
		alert("������[���º󹤳̷Ѽ����]��");
		FormName.gxhcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhcdzwjmje, "���º󹤳̷Ѽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhglfbfb)=="") {
		alert("������[���º����Ѱٷֱ�]��");
		FormName.gxhglfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglfbfb, "���º����Ѱٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqguanlif)=="") {
		alert("������[���º���ǰ�����]��");
		FormName.gxhzqguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqguanlif, "���º���ǰ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhglfjmje)=="") {
		alert("������[���º����Ѽ����]��");
		FormName.gxhglfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglfjmje, "���º����Ѽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhguanlif)=="") {
		alert("������[���º��ۺ�����]��");
		FormName.gxhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhguanlif, "���º��ۺ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsuijinbfb)=="") {
		alert("������[���º�˰��ٷֱ�]��");
		FormName.gxhsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijinbfb, "���º�˰��ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqsuijin)=="") {
		alert("������[���º���ǰ˰��]��");
		FormName.gxhzqsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqsuijin, "���º���ǰ˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsjjmje)=="") {
		alert("������[���º�˰������]��");
		FormName.gxhsjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjjmje, "���º�˰������"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsuijin)=="") {
		alert("������[���º��ۺ�˰��]��");
		FormName.gxhsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijin, "���º��ۺ�˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqsjf)=="") {
		alert("������[���º���ǰ��Ʒ�]��");
		FormName.gxhzqsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqsjf, "���º���ǰ��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsjf)=="") {
		alert("������[���º��ۺ���Ʒ�]��");
		FormName.gxhsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjf, "���º��ۺ���Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqwjrqyexm)=="") {
		alert("������[���º���ǰδ����ǩԼ���]��");
		FormName.gxhzqwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqwjrqyexm, "���º���ǰδ����ǩԼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzhwjrqyexm)=="") {
		alert("������[���º��ۺ�δ����ǩԼ���]��");
		FormName.gxhzhwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzhwjrqyexm, "���º��ۺ�δ����ǩԼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqqtsf)=="") {
		alert("������[���º���ǰ����ҵ��������]��");
		FormName.gxhzqqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqqtsf, "���º���ǰ����ҵ��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzhqtsf)=="") {
		alert("������[���º��ۺ����ҵ��������]��");
		FormName.gxhzhqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzhqtsf, "���º��ۺ����ҵ��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhhtjz)=="") {
		alert("������[���º��ͬ��ֵ]��");
		FormName.gxhhtjz.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhhtjz, "���º��ͬ��ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsgcbj)=="") {
		alert("������[���º�ʩ���ɱ���]��");
		FormName.gxhsgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsgcbj, "���º�ʩ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhmle)=="") {
		alert("������[���º�ë����]��");
		FormName.gxhmle.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhmle, "���º�ë����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhmll)=="") {
		alert("������[���º�ë����]��");
		FormName.gxhmll.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhmll, "���º�ë����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhyjjz)=="") {
		alert("������[���º�ҵ����ֵ]��");
		FormName.gxhyjjz.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhyjjz, "���º�ҵ����ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhyjjzcs)=="") {
		alert("������[���º�ҵ����ֵ����]��");
		FormName.gxhyjjzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhyjjzcs, "���º�ҵ����ֵ����"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhcbj)=="") {
		alert("������[���º�ɱ���]��");
		FormName.gxhcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhcbj, "���º�ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhgcjcbj)=="") {
		alert("������[���º󹤳̻�������]��");
		FormName.gxhgcjcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhgcjcbj, "���º󹤳̻�������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
