<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',sjs,hth,khxm,fwdz,bjjbmc,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),yjjzsj,tdyjjzsj,wdzgce,TO_CHAR(zkl),qye,zhljzjx,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,zjxm,cxhdbm,a.dwmc qydm,TO_CHAR(qyrq,'YYYY-MM-DD'),tdsj ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bdm_bjjbbm.lx='1'";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt in('2','3','5')";
	ls_sql+=" and yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '',sjs,hth,khxm,fwdz,bjjbmc,'<B><font color=\"#FF0000\">���˵�</font></B>',yjjzsj,tdyjjzsj,-1*wdzgce,TO_CHAR(zkl),-1*qye,0,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,zjxm,cxhdbm,a.dwmc qydm,TO_CHAR(qyrq,'YYYY-MM-DD'),tdsj ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a ,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bdm_bjjbbm.lx='1'";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
	ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
	ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by sjs,yjjzsj";

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
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����ҵ����ϸ��<%=dwmc%>��
  <BR>(����ҵ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">��װ��־</td>
	<td  width="3%">ǩ������ҵ��ʱ��</td>
	<td  width="3%">�˵�����ҵ��ʱ��</td>
	<td  width="3%">��ǰ��ͬ�ܶ�</td>
	<td  width="2%">�ۿ���</td>
	<td  width="3%">�ۺ��ͬ�ܶ�</td>
	<td  width="3%">������</td>
	<td  width="3%">��ǰ���̷�</td>
	<td  width="3%">�ۺ󹤳̷�</td>
	<td  width="2%">˰��</td>
	<td  width="3%">��ǰ˰��</td>
	<td  width="3%">˰��</td>
	<td  width="2%">����Ѱٷֱ�</td>
	<td  width="3%">��ǰ�����</td>
	<td  width="3%">�ۺ�����</td>
	<td  width="2%">��ǰ����ҵ��������</td>
	<td  width="2%">�ۺ����ҵ��������</td>
	<td  width="2%">��ǰ����ҵ��������</td>
	<td  width="2%">�ۺ󲻼�ҵ��������</td>
	<td  width="2%">��ǰ��Ʒ�</td>
	<td  width="2%">�ۺ���Ʒ�</td>


	<td  width="3%">����ʵ�տ�</td>
	<td  width="3%">�״���װ��ʱ��</td>
	<td  width="3%">�����״����ʱ��</td>


	<td  width="2%">��ȯ�ܽ��</td>
	<td  width="2%">��˾�е���ȯ��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�Ա</td>
	<td  width="5%">�����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">�˵�ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
	pageObj.displayFoot();
%> 

</body>
</html>

