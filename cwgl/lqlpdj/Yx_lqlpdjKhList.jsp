<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");


	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxkhxx.fwdz,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','��ȡ','2','�˻�'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,crm_zxkhxx.sjs,b.dwmc zxdm,yx_lqlpdj.lrr,yx_lqlpdj.lrsj,a.dwmc lrbm,yx_lqlpdj.bz,yx_lqlpdj.khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,yx_lqlpdj  ";
    ls_sql+=" where yx_lqlpdj.khbh=crm_zxkhxx.khbh and yx_lqlpdj.lrbm=a.dwbh and crm_zxkhxx.zxdm=b.dwbh(+)";
    ls_sql+=" and yx_lqlpdj.khbh='"+khbh+"'";
    ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";

//	out.println(ls_sql);
	
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yx_lqlpdjKhList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","crm_zxkhxx_zxdm","lpmc","yx_lqlpdj_lpsl","yx_lqlpdj_lqsj","yx_lqlpdj_shth","yx_lqlpdj_lrr","yx_lqlpdj_lrsj","sq_dwxx_dwmc","yx_lqlpdj_bz","yx_lqlpdj_thdjr","yx_lqlpdj_thdjsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","lpmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����Ʒ"};//��ť����ʾ����
	String[] buttonLink={"Yx_lqlpdjKhList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem =request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update yx_lqlpdj set shth='2',thdjr='"+yhmc+"',thdjsj=TRUNC(SYSDATE) where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����Ʒ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="5%">��ȡʱ��</td>
	<td  width="3%">�Ƿ��˻�</td>
	<td  width="3%">�˻صǼ���</td>
	<td  width="5%">�˻صǼ�ʱ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="7%">��ѯ����</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="19%">��ע</td>
	<td  width="4%">�ͻ����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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