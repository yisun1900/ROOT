<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String dwbh=request.getParameter("dwbh");
	String yjjzsj=request.getParameter("yjjzsj");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',b.dwmc dwbh,sjs,DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),khbh,hth,khxm,qyrq,tdsj,sgdmc,zjxm,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,a.dwmc fgsbh  ";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD') and cw_qmjzmx.dwbh='"+dwbh+"' and cw_qmjzmx.fgsbh=a.dwbh(+) and cw_qmjzmx.dwbh=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" order by zt desc,cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����ǩԼ��ϸ��<%=dwmc%>��
  <b>(ҵ����תʱ�䣺<%=yjjzsj%>)</b><BR>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">�˵�ʱ��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="4%">δ���۹��̶�</td>
	<td  width="4%">����ǩԼ��</td>
	<td  width="3%">˰��</td>
	<td  width="2%">˰��ٷֱ�</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">�����</td>
	<td  width="3%">�����</td>
	<td  width="2%">������ĿǩԼ��</td>
	<td  width="3%">��ǰ�ۼƹ���������</td>
	<td  width="3%">�ۺ��ۼƹ���������</td>
	<td  width="2%">������˰��</td>
	<td  width="3%">�ۼƼ�������</td>
	<td  width="3%">�ۼƼ����������</td>
	<td  width="2%">ʵ���ۿ���</td>
	<td  width="4%">�μӴ����</td>
	<td  width="4%">��װʵ�����</td>
	<td  width="2%">��װ�������</td>
	<td  width="3%">�״θ���װ��ʱ��</td>
	<td  width="3%">��װ�������ʱ��</td>
	<td  width="4%">�����װʵ�տ��</td>
	<td  width="2%">�����װ�տ�����</td>
	<td  width="3%">�����״��ռ�װ��ʱ��</td>
	<td  width="3%">�����װ����տ�ʱ��</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="4%">�����ֹ�˾���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>
</body>
</html>
