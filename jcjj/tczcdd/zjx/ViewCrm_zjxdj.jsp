<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_zjxdj_zjxxh=null;
String khbh=null;
String dm_zjxfsjd_zjxfsjdmc=null;
String crm_zjxdj_zjxyysm=null;
double zjje=0;
String crm_zjxdj_lrr=null;
String crm_zjxdj_lrsj=null;
String crm_zjxdj_fssj=null;
String crm_zjxdj_lrdw=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
double jzjje=0;
double kglf=0;
double kqtk=0;
double zhzjxje=0;
double zjxje=0;
double zjxsuijin=0;
double zqguanlif=0;
double zhguanlif=0;
double glfbfb=0;
double suijin=0;
double suijinbfb=0;

double zjxjme=0;
double glfjmje=0;
double sjjmje=0;
double zqzjxsuijin=0;

String zjxyymc=null;
String wdzgce=null;
String qye=null;
String zkl=null;
String jzbz=null;

String lx=null;

double gczxzq=0;
double gcjxzq=0;
double gczxzh=0;
double gcjxzh=0;
double zjxrzf=0;
double zjxdjjje=0;


double jxglfbfb=0;
double djjbfb=0;
double rzfbfb=0;

double zqsjf=0;
double zhsjf=0;

double zqzjze=0;
double zhzjze=0;

double zqqtsf=0;
double zhqtsf=0;
String qtsfsm=null;
double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm=null;


String zjxxh=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zjxdj.lx,crm_zjxdj.zjxsuijin,crm_zjxdj.zqguanlif,crm_zjxdj.zhguanlif,crm_khxx.glfbfb,crm_khxx.suijin,crm_khxx.suijinbfb,crm_khxx.zhzjxje,crm_khxx.jzbz,crm_khxx.wdzgce,crm_khxx.zkl,crm_khxx.zjxje,crm_zjxdj.kqtk,jzjje,crm_zjxdj.kglf,crm_zjxdj.zjxxh as crm_zjxdj_zjxxh,crm_zjxdj.khbh as khbh,dm_zjxfsjd.zjxfsjdmc as dm_zjxfsjd_zjxfsjdmc,crm_zjxdj.zjxyysm as crm_zjxdj_zjxyysm,crm_zjxdj.zjje as zjje,crm_zjxdj.lrr as crm_zjxdj_lrr,crm_zjxdj.lrsj as crm_zjxdj_lrsj,crm_zjxdj.fssj as crm_zjxdj_fssj,crm_zjxdj.lrdw as crm_zjxdj_lrdw,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm ";
	ls_sql+=" ,crm_zjxdj.zjxjme,crm_zjxdj.glfjmje,crm_zjxdj.sjjmje,crm_zjxdj.zqzjxsuijin";
	ls_sql+=" ,gczxzq,gcjxzq,gczxzh,gcjxzh,zjxrzf,zjxdjjje";
	ls_sql+=" ,crm_zjxdj.zqsjf,crm_zjxdj.zhsjf,crm_zjxdj.zqzjze,crm_zjxdj.zhzjze  ,crm_zjxdj.zqqtsf,crm_zjxdj.zhqtsf,crm_zjxdj.qtsfsm ,crm_zjxdj.zqwjrqyexm,crm_zjxdj.zhwjrqyexm,crm_zjxdj.wjrqyexmsm";
	ls_sql+=" from  crm_zjxdj,dm_zjxfsjd,crm_khxx";
	ls_sql+=" where crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+) and crm_zjxdj.khbh=crm_khxx.khbh(+) and  (crm_zjxdj.zjxxh='"+zjxxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqsjf=rs.getDouble("zqsjf");
		zhsjf=rs.getDouble("zhsjf");

		zqzjze=rs.getDouble("zqzjze");
		zhzjze=rs.getDouble("zhzjze");
		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		
		gczxzq=rs.getDouble("gczxzq");
		gcjxzq=rs.getDouble("gcjxzq");
		gczxzh=rs.getDouble("gczxzh");
		gcjxzh=rs.getDouble("gcjxzh");
		zjxrzf=rs.getDouble("zjxrzf");
		zjxdjjje=rs.getDouble("zjxdjjje");

		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");

		
		lx=cf.fillNull(rs.getString("lx"));
		zjxsuijin=rs.getDouble("zjxsuijin");
		zqguanlif=rs.getDouble("zqguanlif");
		zhguanlif=rs.getDouble("zhguanlif");
		glfbfb=rs.getDouble("glfbfb");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxje=rs.getDouble("zjxje");
		jzbz=cf.fillNull(rs.getString("jzbz"));
		wdzgce=cf.fillNull(rs.getString("wdzgce"));
		zkl=cf.fillNull(rs.getString("zkl"));
		kqtk=rs.getDouble("kqtk");
		jzjje=rs.getDouble("jzjje");
		kglf=rs.getDouble("kglf");
		crm_zjxdj_zjxxh=cf.fillNull(rs.getString("crm_zjxdj_zjxxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		dm_zjxfsjd_zjxfsjdmc=cf.fillNull(rs.getString("dm_zjxfsjd_zjxfsjdmc"));
		crm_zjxdj_zjxyysm=cf.fillNull(rs.getString("crm_zjxdj_zjxyysm"));
		zjje=rs.getDouble("zjje");
		crm_zjxdj_lrr=cf.fillNull(rs.getString("crm_zjxdj_lrr"));
		crm_zjxdj_lrsj=cf.fillNull(rs.getDate("crm_zjxdj_lrsj"));
		crm_zjxdj_fssj=cf.fillNull(rs.getDate("crm_zjxdj_fssj"));
		crm_zjxdj_lrdw=cf.fillNull(rs.getString("crm_zjxdj_lrdw"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
	}
	else{
		rs.close();
		ps.close();

		return;
	}
	rs.close();
	ps.close();


	String fgsbh=null;
	ls_sql="select glfbfb,suijinbfb,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		glfbfb=rs.getDouble("glfbfb");
		suijinbfb=rs.getDouble("suijinbfb");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	ls_sql="select jxglfbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglfbfb=rs.getDouble("jxglfbfb");//����۹���Ѱٷֱ�
	}
	rs.close();
	ps.close();

	ls_sql="select rzfbfb";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rzfbfb=rs.getDouble("rzfbfb");//��֤�Ѱٷֱ�
	}
	rs.close();
	ps.close();

	ls_sql="select khfqbfb";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjbfb=rs.getDouble("khfqbfb");//����ȯ�ٷֱ�
	}
	rs.close();
	ps.close();

	zjxyymc="";
	int row=0;
	ls_sql="select zjxyymc";
	ls_sql+=" from  dm_zjxyybm,crm_zjxyydj";
	ls_sql+=" where dm_zjxyybm.zjxyybm=crm_zjxyydj.zjxyybm and crm_zjxyydj.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row++;
		zjxyymc+=row+"��"+rs.getString("zjxyymc")+"��";
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<div align="center">�˲����Ǽǣ��˲�����ţ�<%=crm_zjxdj_zjxxh%>��</div> 
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ͻ����    </td>
    <td width="32%"><%=khbh%> </td>
    <td width="20%" align="right"> 
      ��ͬ��    </td>
    <td width="30%"><%=crm_khxx_hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�ͻ�����</td>
    <td width="32%"><%=crm_khxx_khxm%>��<%=crm_khxx_lxfs%>��</td>
    <td align="right" width="20%">ǩԼ����</td>
    <td width="30%"><%=crm_khxx_qyrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ���ݵ�ַ    </td>
    <td colspan="3"> <%=crm_khxx_fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="20%" align="right"> 
      ���ʦ    </td>
    <td width="30%"> <%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ʼ�    </td>
    <td width="32%"><%=crm_khxx_zjxm%></td>
    <td width="20%" align="right"> 
      ʩ����    </td>
    <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ��ǰ��ͬ��    </td>
    <td width="32%"><%=wdzgce%> </td>
    <td width="20%" align="right">�ۺ��ͬ��</td>
    <td width="30%"><%=qye%> </td>
  </tr>
  <tr bgcolor="#CCCCFF" align="center"> 
    <td colspan="4">�����������</td>
  </tr>
</table>

<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#E8E8FF"><STRONG>���̷�</STRONG></td>
    <td width="1%" rowspan="15" align="right" bgcolor="#000033">&nbsp;</td>
    <td colspan="2" align="center" bgcolor="#E8E8FF"><STRONG>�����</STRONG></td>
    <td width="1%" rowspan="5" align="right" bgcolor="#000033">&nbsp;</td>
    <td colspan="2" align="center" bgcolor="#E8E8FF"><STRONG>˰��</STRONG></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#FFFFFF"><p><font color="#CC0066">����Ϊ��������Ϊ��</font></p></td>
    <td align="right">����Ѱٷֱ�</td>
    <td bgcolor="#FFFFFF"><%=glfbfb%>��</td>
    <td align="right" bgcolor="#FFFFFF">˰��ٷֱ�</td>
    <td bgcolor="#FFFFFF"><%=suijinbfb%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̷�-��ǰ</td>
    <td bgcolor="#FFFFFF"><%=zjje%></td>
    <td align="right">�����-��ǰ</td>
    <td bgcolor="#FFFFFF"><%=zqguanlif%></td>
    <td align="right" bgcolor="#FFFFFF">˰��-��ǰ</td>
    <td bgcolor="#FFFFFF"><%=zqzjxsuijin%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">���̷Ѽ����</td>
    <td bgcolor="#FFFFFF"><%=zjxjme%></td>
    <td align="right">����Ѽ����</td>
    <td bgcolor="#FFFFFF"><%=glfjmje%></td>
    <td align="right" bgcolor="#FFFFFF">˰������</td>
    <td bgcolor="#FFFFFF"><%=sjjmje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̷�-�ۺ�</td>
    <td bgcolor="#FFFFFF"><%=jzjje%></td>
    <td align="right">�����-�ۺ�</td>
    <td bgcolor="#FFFFFF"><%=zhguanlif%></td>
    <td align="right">˰��-�ۺ�</td>
    <td><%=zjxsuijin%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="15%">&nbsp;</td>
    <td width="18%" bgcolor="#FFFFFF">&nbsp;</td>
    <td colspan="5" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td bgcolor="#FFFFFF"><%=kqtk%></td>
    <td align="right"><STRONG>����۹����</STRONG></td>
    <td bgcolor="#FFFFFF"><%=jxglfbfb%>%</td>
    <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">����۹����</td>
    <td bgcolor="#FFFFFF"><%=kglf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong><font color="#FF0000">�����ܶ��ǰ</font></strong></td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zqzjze%></b></font></td>
    <td align="right"><STRONG>��֤�Ѱٷֱ�</STRONG></td>
    <td bgcolor="#FFFFFF"><%=rzfbfb%>%</td>
    <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">�˲�����֤��</td>
    <td bgcolor="#FFFFFF"><%=zjxrzf%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="15%"><font color="#FF0000"><strong>�����ܶ�ۺ�</strong></font></td>
    <td width="18%" bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zhzjze%></b></font></td>
    <td align="right" width="15%"><STRONG>����ȯ�ٷֱ�</STRONG></td>
    <td width="18%" bgcolor="#FFFFFF"><%=djjbfb%>%</td>
    <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right" width="15%">�˲�������ȯ</td>
    <td width="17%" bgcolor="#FFFFFF"><%=zjxdjjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���������ǰ</td>
    <td bgcolor="#FFFFFF"><%=gczxzq%></td>
    <td align="right">��������ۺ�</td>
    <td bgcolor="#FFFFFF"><%=gczxzh%></td>
    <td align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̼����ǰ</td>
    <td bgcolor="#FFFFFF"><%=gcjxzq%></td>
    <td align="right">���̼���ۺ�</td>
    <td bgcolor="#FFFFFF"><%=gcjxzh%></td>
    <td align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ʒѣ���ǰ</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zqsjf%></b></font></td>
    <td align="right">��Ʒѣ��ۺ�</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zhsjf%></b></font></td>
    <td align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ҵ�������ѣ���ǰ</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zqqtsf%></b></font></td>
    <td align="right">����ҵ�������ѣ��ۺ�</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zhqtsf%></b></font></td>
    <td align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">����ҵ����������Ŀ</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=qtsfsm%></b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ҵ�������ѣ���ǰ</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zqwjrqyexm%></b></font></td>
    <td align="right">����ҵ�������ѣ��ۺ�</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=zhwjrqyexm%></b></font></td>
    <td align="right" bgcolor="#000033">&nbsp;</td>
    <td align="right">����ҵ����������Ŀ</td>
    <td bgcolor="#FFFFFF"><font color="#0000CC"><b><%=wjrqyexmsm%></b></font></td>
  </tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  

  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �˲��������׶�    </td>
    <td width="32%"> <%=dm_zjxfsjd_zjxfsjdmc%> </td>
    <td width="20%" align="right"> 
      �˲�������ʱ��    </td>
    <td width="30%"><%=crm_zjxdj_fssj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�˲���ԭ��</td>
    <td colspan="3"><%=zjxyymc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�˲���˵��</td>
    <td colspan="3"><%=crm_zjxdj_zjxyysm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">¼�뵥λ</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_zjxdj_lrdw+"'",crm_zjxdj_lrdw,true);
%></td>
    <td width="20%" align="right"><b>����</b></td>
    <td width="30%"><font color="#0000CC"><b><%
	cf.radioToken(out,"1+����ϸ&2+����ϸ",lx,true);
%></b></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ¼��ʱ��    </td>
    <td width="32%"> <%=crm_zjxdj_lrsj%> </td>
    <td width="20%" align="right"> 
      ¼����    </td>
    <td width="30%"><%=crm_zjxdj_lrr%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="4">  

      <input type="button" value="����ԭ����" onClick="window.open('/dhzx/sjszxone/dybj.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" value="����ǰ���" onClick="window.open('dybjQ.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" value="���������" onClick="window.open('dybjH.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" value="����ǰ��Ա�" onClick="window.open('dybjQH.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" value="���̱����" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxBgdList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')">
      <input type="button" onClick="window.open('dzbj/zxbjmx/Bj_zjxzcbgqdCxList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')" value="���ı����">
	  <input type="button" onClick="window.open('dzbj/zxbjmx/Jc_zcddCxList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')" value="�ֽⶩ��">
	        <input type="button" onClick="window.open('/gcgl/zjx/ViewCrm_zjxtckhqye.jsp?zjxxh=<%=zjxxh%>')" value="�ײͼ۸�">
	        <input type="button"  value="�Ҿ��ײͺ�ͬ" onClick="window.open('dzbj/zxbjmx/Bj_zctcmcDyListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  />
	        <input  type="button" onClick="window.open('dzbj/zxbjmx/Bj_zjxzcbgqdCxListAll.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>')" value="���ı����ϸ"></td>
			
			

  </tr>
</table>




</body>
</html>
