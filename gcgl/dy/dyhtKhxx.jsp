<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>



<body bgcolor="#FFFFFF">

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String zjxm=null;
String qyrq=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String xxshyj=null;
String hxbm=null;
String fwmj=null;


double sjhtje=0;

double wdzgce=0;
double qye=0;
double zhgczjf=0;
double suijin=0;
double zkl=0;
double zhzjxje=0;
double glftd=0;
double guanlif=0;
double zhqtsf=0;
double zhwjrqyexm=0;



int gqts=0;
String zqkrq=null;
String email=null;
String qtfy="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT crm_khxx.email,kgrq+gqts/2 zqkrq,gqts,zhqtsf,zhwjrqyexm,zhgczjf,xxshyj,guanlif,fgsbh,glftd,zhzjxje,zkl,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.sgd,sgdmc,crm_khxx.sgbz,crm_khxx.dwbh,dwmc,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.zjxm,qyrq,kgrq,jyjdrq,jgrq,wdzgce,qye,suijin,DECODE(crm_khxx.bjjb,'A','��ͨ','B','��Ʒ','C','�ֻ�÷��') bjjb,crm_khxx.fwmj,crm_khxx.hxbm";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		email=cf.fillHtml(rs.getString("email"));
		zqkrq=cf.fillNull(rs.getDate("zqkrq"));
		gqts=rs.getInt("gqts");
		zhqtsf=rs.getDouble("zhqtsf");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		zhgczjf=rs.getDouble("zhgczjf");
		xxshyj=cf.fillHtml(rs.getString("xxshyj"));
		guanlif=rs.getDouble("guanlif");
		glftd=rs.getDouble("glftd");
		zhzjxje=rs.getDouble("zhzjxje");
		zkl=rs.getDouble("zkl");
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillHtml(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillHtml(rs.getString("cxhdbmzh"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		fgsbh=cf.fillHtml(rs.getString("fgsbh"));
		fwmj=cf.fillHtml(rs.getString("fwmj"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));

		//sjhtje=rs.getDouble("sjhtje");

		if (!zqkrq.equals(""))
		{
			zqkrq=zqkrq.substring(0,4)+"��"+zqkrq.substring(5,7)+"��"+zqkrq.substring(8,10)+"��ǰ";
		}
	}
	rs.close();
	ps.close();


	String getsfxmmc="";
	String getsfje="";

	ls_sql=" select sfxmmc,sfje ";
	ls_sql+=" from bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"' and sfxmlx not in('5','6')";
	ls_sql+=" order by sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		getsfje=cf.fillNull(rs.getString("sfje"));

		qtfy+=getsfxmmc+":"+getsfje+"&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	rs.close();
	ps.close();

	if (qtfy.equals(""))
	{
		qtfy="�����ѣ�0";
	}


	

	
	
	//�����������վݱ��
	String lfsjbh="&nbsp;";	
	String jlfdjsj="&nbsp;";
	double lfdj=0;
	ls_sql=" select sjbh,fkje,sksj ";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='52' and khbh='"+khbh+"' and scbz='N' and fkje>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lfsjbh=cf.fillNull(rs.getString("sjbh"));
		lfdj=rs.getDouble("fkje");
		jlfdjsj=cf.fillNull(rs.getDate("sksj"));
	}
	rs.close();
	ps.close();

	double alllfdj=0;
	ls_sql=" select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='52' and khbh='"+khbh+"' and scbz='N'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		alllfdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (alllfdj==0)
	{
		lfsjbh="&nbsp;";	
		jlfdjsj="&nbsp;";
		lfdj=0;
	}

	//��ȡʵ����Ʒѽ��
	String sjsjbh="&nbsp;";	
	double sjf=0;
	String jsjfsj="&nbsp;";	
	ls_sql=" select sjbh,fkje,sksj ";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='53' and khbh='"+khbh+"' and scbz='N' and fkje>0 ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsjbh=cf.fillNull(rs.getString("sjbh"));
		sjf=rs.getDouble("fkje");
		jsjfsj=cf.fillNull(rs.getDate("sksj"));
	}
	rs.close();
	ps.close();

	double allsjf=0;
	ls_sql=" select sum(fkje)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fklxbm ='53' and khbh='"+khbh+"' and scbz='N'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allsjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (allsjf==0)
	{
		sjsjbh="&nbsp;";	
		sjf=0;
		jsjfsj="&nbsp;";	
	}


	ls_sql="update crm_khxx set dybz='Y',dysj=SYSDATE ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

%>



<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">��װ��ͬ��Ҫ��Ϣȷ�ϱ�</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
    <tr height="29"> 
    
    <td colspan="8" align="center"><b>��ͬ������Ϣ</b></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>�ͻ�����</b></td>
    <td colspan="2"><%=khxm%></td>
    <td width="12%" align="center"><b>�� ��</b></td>
	 <td colspan="2" ><%=lxfs%></td>
    <td width="11%" align="center"><b>�� ͬ ��</b></td>
    <td width="15%" ><%=hth%></td>
  </tr>
  <tr height="29"> 
  <td align="center"><b>���ʦ</b></td>
    <td colspan="2"><%=sjs%></td>
    <td align="center"><b>�ͻ�����</b></td>
	 <td colspan="4" ><%=email%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>���ݵ�ַ</b></td>
    <td colspan="7"><%=fwdz%></td>
  </tr>
    <tr height="29"> 
  <td align="center"><b>��ͬ����</b></td>
    <td colspan="2"><%=lfdj%></td>
    <td align="center"><b>����ʱ��</b></td>
	 <td colspan="2" ><%=jlfdjsj%></td>
      <td width="11%" align="center"><b>�վݱ��</b></td>
    <td ><%=lfsjbh%></td>
  </tr>
  <tr height="29"> 
  <td width="14%" align="center"><b>��Ʒ�</b></td>
    <td colspan="2"><%=sjf%></td>
    <td align="center"><b>����ʱ��</b></td>
	 <td colspan="2" ><%=jsjfsj%></td>
    <td width="11%" align="center"><b>�վݱ��</b></td>
    <td ><%=sjsjbh%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>����װ�����</b></td>
    <td colspan="2"><%=fwmj%></td>
    <td align="center"><b>���̻���</b></td>
    <td colspan="4"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>ǩԼ����</b></td>
    <td colspan="2"><%=qyrq%></td>
    <td align="center"><b>��ͬ����</b></td>
    <td colspan="4"><%=kgrq%>---<%=jgrq%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ڣ�<%=gqts%>��</td>
  </tr>
 
  <tr height="29"> 
    <td colspan="8" align="center" height="27"><b>���̿�ͱ�����Ŀ</b></td>
  </tr>
  <tr height="29"> 
    <td align="center"><b>��ͬǩԼ��</b></td>
    <td width="12%" align="center"><strong>Сд���</strong></td>
    <td colspan="2"><%=cf.formatDouble(qye)%></td>
    <td width="12%" align="center"><b>��д���</b></td>
    <td colspan="3"><%=cf.NumToRMBStr(qye)%></td>
  </tr>
 <tr height="29"> 
    <td align="center"><b>������ط�</b></td>
    <td colspan="7"><b><%=qtfy%></b></td>
  </tr>
  <tr height="29"> 
    <td  align="center"><b>����ǩԼ��</b></td>
    <td colspan="2"><%=zhgczjf%></td>
    <td align="center"><b>˰������</b></td>
    <td><b><%=suijin%></b></td>
    <td colspan="2" align="center"><b>��Ŀ�����</b></td>
    <td><%=guanlif%></td>
  </tr>
   <tr height="29"> 
    <td colspan="3" align="center"><b>��<input type="checkbox" name="checkbox" value="checkbox">��<input type="checkbox" name="checkbox" value="checkbox">�����</b></td>
    <td  align="center" colspan="2"><b>���������</b></td>
	 <td colspan="3"><%=cxhdbm%><%=cxhdbmxq%><%=cxhdbmzh%></td>
  </tr>
   
  
  <tr height="29"> 
    <td colspan="8" ><b>&nbsp;&nbsp;��ͬǩ����Ч�󣬿ͻ������б��е�Լ��֧�����̿</b></td>
  </tr>

  <tr height="29"> 
    <td align="center"><b>֧������</b></td>
	   <td colspan="3" align="center"><b>֧��ʱ��</b></td>
	   <td  colspan="2" align="center"><b>���̿�֧������</b></td>
    <td colspan="2" align="center"><b>Ӧ֧�����</b></td>
  </tr>

<%
	int fkqs=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkfa,cw_fkfamx,cw_fkcs";
	ls_sql+=" where  cw_khfkfa.fkfabm=cw_fkfamx.fkfabm";
	ls_sql+=" and  cw_fkfamx.fkcs=cw_fkcs.fkcs";
	ls_sql+=" and cw_khfkfa.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkqs=rs.getInt(1);
	}
	rs.close();
	ps.close();


	String fkcsmc="";
	int fkcs=0;
	double bqfkbl=0;
	ls_sql="select cw_fkfamx.fkcs,fkcsmc,bqfkbl";
	ls_sql+=" from  cw_khfkfa,cw_fkfamx,cw_fkcs";
	ls_sql+=" where  cw_khfkfa.fkfabm=cw_fkfamx.fkfabm";
	ls_sql+=" and  cw_fkfamx.fkcs=cw_fkcs.fkcs";
	ls_sql+=" and cw_khfkfa.khbh='"+khbh+"'";
	ls_sql+=" order by cw_fkfamx.fkcs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkcs=rs.getInt("fkcs");
		fkcsmc=rs.getString("fkcsmc");
		bqfkbl=rs.getDouble("bqfkbl");

		String fksjStr="";

		if (fkqs==2)
		{
			if (fkcs==1)
			{
				fksjStr="��������ǰ";
			}
			else if (fkcs==2)
			{
				fksjStr="�������պϸ�2����";
			}
		}
		else if (fkqs==3)
		{
			if (fkcs==1)
			{
				fksjStr="��������ǰ";
			}
			else if (fkcs==2)
			{
				fksjStr=zqkrq;
			}
			else if (fkcs==3)
			{
				fksjStr="�������պϸ�2����";
			}
		}
		else if (fkqs==4)
		{
			if (fkcs==1)
			{
				fksjStr="��������ǰ";
			}
			else if (fkcs==2)
			{
				fksjStr="ˮ������ι������պ�";
			}
			else if (fkcs==3)
			{
				fksjStr="�������պ�";
			}
			else if (fkcs==4)
			{
				fksjStr="�������պϸ�5����";
			}
		}

		if (fksjStr.equals(""))
		{
			fksjStr="&nbsp;";
		}

		%>
		<tr height="29"> 
			<td align="center"><b><%=fkcsmc%></b></td>
			<td colspan="3" align="center"><b><%=fksjStr%></b></td>
			<td colspan="2" align="center"><b><%=cf.formatDouble(bqfkbl,"###")%>%</b></td>
			<td colspan="2" align="center"><%=cf.formatDouble(qye*bqfkbl/100)%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


%>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"style='FONT-SIZE: 14px'>
 <tr height="29"> 
  
    <td ></td>
  </tr> 
  <tr height="29"> 
  
    <td >��ע��1������Ϊ��װ��ͬ��Ҫ�������ͻ�����ǩ��ȷ�ϡ�</td>
  </tr>
   <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2�������еĺ�ͬ���ΪԤ�����������������ڽ��ɣ���ͬ������������깤��</td>
  </tr>
   <tr height="29">
     <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʵ�ʷ���Ϊ׼��</td>
   </tr>
   <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3�������վ��Ͽͻ�����Ӧ���ͬ�Ͽͻ���������������ֹ���β����ʾ�վ�ԭ����</td>
  </tr>
  <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4��������طѲ������ڡ���ͬǩԼ��У����ں�ͬǩ��ʱһ��ȫ��ɡ� </td>
  </tr>
  <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5���뽫������ҹ�˾ָ�����տ���Ա��ͬʱ���Ʊ��ܸ����ҹ�˾�տ�ר���µ��վݡ�</td>
  </tr>
  <tr height="29"> 
  
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6����ͻ�������Ч�ĵ绰����������ַ���Ա�֤��˾�ܹ��������絽�ͻ����ˡ�</td>
  </tr>
  <tr height="29"> 
  
    <td ></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"style='FONT-SIZE: 14px'>
  <tr height="100"> 
  
    <td width="31%" >&nbsp;</td>
	<td width="23%" >�ͻ�ǩ�֣�</td>
	<td width="46%" >���ڣ�</td>
  </tr>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
 





