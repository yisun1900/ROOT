<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;



	String fgsbh=request.getParameter("fgsbh");
	String khzq=request.getParameter("khzq");

	String tcqssj=cf.executeQuery("select TO_CHAR(khqssj,'YYYY-MM-DD') from cw_jrkhzq where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'");
	String tcjzsj=cf.executeQuery("select TO_CHAR(khjzsj,'YYYY-MM-DD') from cw_jrkhzq where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'");


	ls_sql="SELECT DECODE(crm_khxx.sjsjsbz,'0','δ���','1','ǩ�����','2','�������'),crm_khxx.yjjzsj,crm_khxx.htshsj,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,bjjbmc,crm_khxx.sjs,crm_khxx.zjxm,sgdmc,qye,sfke,dwmc,crm_khxx.khbh,gcjdmc  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm,bdm_bjjbbm ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";


	ls_sql+=" and crm_khxx.zt!='3'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2���������
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.htshsj is not null";




    ls_sql+=" order by crm_khxx.yjjzsj,crm_khxx.dwbh,sjs,khxm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxQdCxList.jsp","","","InsertCw_jrtcmxQd.jsp?khzq="+khzq);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");

//���ð�ť����
	String[] buttonName={"���"};//��ť����ʾ����
	String[] buttonLink={"InsertCw_jrtcmxQd.jsp?khzq="+khzq};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ǩ�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">�������</td>
	<td  width="6%">����ҵ��ʱ��</td>
	<td  width="6%">��ͬ���ʱ��</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="6%">��ͬ��</td>
	<td  width="4%">���ۼ���</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">ʩ����</td>
	<td  width="7%">ǩԼ��</td>
	<td  width="7%">ʵ�տ�</td>
	<td  width="10%">ǩԼ����</td>
	<td  width="4%">�ͻ����</td>
	<td  width="8%">���̽���</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>