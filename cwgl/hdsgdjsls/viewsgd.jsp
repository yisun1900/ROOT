<%@ page contentType="text/html;charset=GBK" %>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	String sjfw=null;
    String sjfw2=null;
	String sgd=request.getParameter("sgd");
	if (sgd!=null){
		if (!(sgd.equals(""))) wheresql+="and cw_gdjsjl.sgd='"+sgd+"'";

	}
    sjfw=request.getParameter("jssj");
    sjfw2=request.getParameter("jssj2");
	if (sjfw!=null){
		if (!(sjfw.equals(""))) wheresql+="and (cw_gdjsjl.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";

	}
	if (sjfw2!=null){
		if (!(sjfw2.equals(""))) wheresql+="and (cw_gdjsjl.jssj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";

	}
	String ls_sql=null;

		ls_sql="SELECT cw_gdjsjl.gdjsjlh, DECODE(cw_gdjsjl.jsjd,'1','���㲿����','2','��������','3','�������'), DECODE(cw_gdjsjl.spjl,'3','ͨ��','4','δͨ��'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.hth,crm_khxx.zjxm ,sgdmc, DECODE(cw_gdjsjl.jzbz,'1','��װ','2','��װ'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze,cw_gdjsjl.sjcb,cw_gdjsjl.sj, DECODE(cw_gdjsjl.tdjs,'1','�ͻ�������','2','ʵ�տ�','3','ǩԼ��','4','ʵ�ʳɱ�'),cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.clf,cw_gdjsjl.zgclf,cw_gdjsjl.jkje,cw_gdjsjl.fakuan,cw_gdjsjl.kwxf,cw_gdjsjl.gckk,cw_gdjsjl.ksdf,cw_gdjsjl.kqtk,cw_gdjsjl.bk,cw_gdjsjl.gdjskze,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.khbh,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+) and cw_gdjsjl.tdjsje>0 ";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_gdjsjl.gdjsjlh ";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","jc_jjdd_clzt","jhccsj","khxm","fwdz","hth","jc_jjdd_dj","yhmc","jc_jjdd_jjsjs","jc_jjdd_ssje","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/
//��������
	String[] keyName={"gdjsjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gdjsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_gdjsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gdjsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ���ӽ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	//pageObj.printPageLink(300);
%>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="3%">�����¼��</td>
	<td  width="3%">�������</td>
	<td  width="2%">��������</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ʼ�</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">��װ��־</td>
	<td  width="3%">δ���۹��̶�</td>
	<td  width="3%">����ǩԼ��</td>
	<td  width="2%">�ۿ���</td>
	<td  width="2%">��������</td>
	<td  width="3%">�ͻ�������</td>
	<td  width="3%">����ʵ�տ��ܶ�</td>
	<td  width="2%">ʵ�ʳɱ�</td>
	<td  width="2%">˰��</td>
	<td  width="3%">������</td>
	<td  width="2%">��������</td>
	<td  width="2%">�����</td>
	<td  width="2%">ά�޽�</td>
	<td  width="2%">�������Ϸ�</td>
	<td  width="2%">�Թ����Ϸ�</td>
	<td  width="2%">�����</td>
	<td  width="2%">������</td>
	<td  width="2%">��ά�޷�</td>
	<td  width="2%">���̿ۿ�</td>
	<td  width="2%">��ˮ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">����</td>
	<td  width="3%">���ӽ�����ܶ�</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="4%">���㵥λ</td>
	<td  width="2%">�ͻ����</td>
	<td  width="6%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>