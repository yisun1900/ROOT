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
	String wheresql="";

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (sq_dwxx.dqbm='"+dqbm+"')";
	}
	String cpbm=null;
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcbm='"+cpbm+"')";
	}

	ls_sql="SELECT TO_CHAR(xh) xh,jc_zcddmx.ddbh,clztmc,crm_khxx.khxm,crm_khxx.fwdz,zcmc,jc_zcddmx.ppmc,xinghao,TO_CHAR(cbj),sl,ROUND(cbj*sl,2),zjhsl,ROUND(cbj*zjhsl,2),gg,zcpzwzbm,jc_zcddmx.khbh";
	ls_sql+=" FROM jc_zcddmx,jc_zcdd,jdm_zcddzt,crm_khxx,sq_dwxx";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcddmx.fgsbh=sq_dwxx.dwbh and jc_zcddmx.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.clzt not in('98','99')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_zcddmx.cbj,xh";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("CpbmCxList.jsp","","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��



//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"�����޸ġ�����ۡ�"};//��ť����ʾ����
	String[] buttonLink={"PlUpdateJsj.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
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
  <B><font size="3">�޸ĵ�Ʒ����ۣ�ע�⣺�ѽ��㶩�������޸ģ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���</td>
	<td  width="5%">�������</td>
	<td  width="5%">����״̬</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="7%">��������</td>
	<td  width="7%">Ʒ��</td>
	<td  width="8%">�ͺ�</td>
	<td  width="5%">�����</td>
	<td  width="4%">��ͬ����</td>
	<td  width="5%">��ͬ������</td>
	<td  width="4%">����������</td>
	<td  width="5%">�����������</td>
	<td  width="11%">���</td>
	<td  width="7%">��װλ��</td>
	<td  width="7%">�ͻ����</td>
</tr>
<%
	pageObj.displayDateSum();
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