<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	String wheresql=request.getParameter("wheresql");
	String dwbh=cf.GB2Uni(cf.getParameter(request,"dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));

	ls_sql="SELECT crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ppbm,jc_zcdd.ddbh,jc_zcdd.xshth,jc_zcdd.wdzje,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.fdbl||'%',jc_zcdd.tjpfdbl||'%',round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2)+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2) cbze,jc_zcdd.khfdbl||'%',jc_zcdd.tjpkhfdbl||'%',round(jc_zcdd.zcpclf*jc_zcdd.khfdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpkhfdbl/100,2) hkze,jc_zcdd.tcjrbl||'%',jc_zcdd.tjptcjrbl||'%',jc_zcdd.htyjjrje,jc_zcdd.qhtsj,jc_zcdd.gys,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh";
	ls_sql+=" and jc_zcdd.ddlx='C'";//C��ѡ����������
	ls_sql+=" and crm_khxx.sjs='"+sjs+"'";
	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_zcdd.lrsj desc,jc_zcdd.ddbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ѡ���������ķ��㣭��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate();
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">���Ϲ���</td>
	<td  width="4%">��Ʒ��</td>

	<td  width="3%">�������</td>
	<td  width="3%">���ۺ�ͬ��</td>
	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="4%">����Ʒ���Ϸ�</td>
	<td  width="4%">�ؼ�Ʒ���Ϸ�</td>
	<td  width="3%">��װ���ϼӹ���</td>
	<td  width="3%">Զ�̷�</td>
	<td  width="3%">����Ʒ�������</td>
	<td  width="3%">�ؼ�Ʒ�������</td>
	<td  width="4%">������</td>
	<td  width="3%">����Ʒ�ͻ��������</td>
	<td  width="3%">�ؼ�Ʒ�ͻ��������</td>
	<td  width="4%">�ͻ��Żݽ��</td>
	<td  width="3%">����Ʒ��ɼ������</td>
	<td  width="3%">�ؼ�Ʒ��ɼ������</td>
	<td  width="4%">��ɼ�����</td>
	<td  width="3%">��������</td>
	<td  width="8%">��Ӧ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="411%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>