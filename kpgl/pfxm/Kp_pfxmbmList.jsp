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
	String kp_pfxmbm_pfxmbm=null;
	String kp_pfxmbm_pfxmmc=null;
	String kp_pfxmbm_fz=null;
	String kp_pfxmbm_kpdlbm=null;
	kp_pfxmbm_pfxmbm=request.getParameter("kp_pfxmbm_pfxmbm");
	if (kp_pfxmbm_pfxmbm!=null)
	{
		kp_pfxmbm_pfxmbm=cf.GB2Uni(kp_pfxmbm_pfxmbm);
		if (!(kp_pfxmbm_pfxmbm.equals("")))	wheresql+=" and  (kp_pfxmbm.pfxmbm='"+kp_pfxmbm_pfxmbm+"')";
	}
	kp_pfxmbm_pfxmmc=request.getParameter("kp_pfxmbm_pfxmmc");
	if (kp_pfxmbm_pfxmmc!=null)
	{
		kp_pfxmbm_pfxmmc=cf.GB2Uni(kp_pfxmbm_pfxmmc);
		if (!(kp_pfxmbm_pfxmmc.equals("")))	wheresql+=" and  (kp_pfxmbm.pfxmmc='"+kp_pfxmbm_pfxmmc+"')";
	}
	kp_pfxmbm_fz=request.getParameter("kp_pfxmbm_fz");
	if (kp_pfxmbm_fz!=null)
	{
		kp_pfxmbm_fz=kp_pfxmbm_fz.trim();
		if (!(kp_pfxmbm_fz.equals("")))	wheresql+=" and (kp_pfxmbm.fz="+kp_pfxmbm_fz+") ";
	}
	kp_pfxmbm_kpdlbm=request.getParameter("kp_pfxmbm_kpdlbm");
	if (kp_pfxmbm_kpdlbm!=null)
	{
		kp_pfxmbm_kpdlbm=cf.GB2Uni(kp_pfxmbm_kpdlbm);
		if (!(kp_pfxmbm_kpdlbm.equals("")))	wheresql+=" and  (kp_pfxmbm.kpdlbm='"+kp_pfxmbm_kpdlbm+"')";
	}
	ls_sql="SELECT kp_pfxmbm.pfxmbm,kp_pfxmbm.pfxmmc,kp_pfxmbm.fz,kp_kpdlbm.kpdlmc  ";
	ls_sql+=" FROM kp_kpdlbm,kp_pfxmbm  ";
    ls_sql+=" where kp_pfxmbm.kpdlbm=kp_kpdlbm.kpdlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pfxmbm.pfxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_pfxmbmList.jsp","SelectKp_pfxmbm.jsp","","EditKp_pfxmbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pfxmbm","kp_pfxmbm_pfxmmc","kp_pfxmbm_fz","kp_kpdlbm_kpdlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pfxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_pfxmbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] pfxmbm = request.getParameterValues("pfxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pfxmbm,"pfxmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_pfxmbm where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="12%">������Ŀ����</td>
	<td  width="22%">������Ŀ����</td>
	<td  width="12%">��ֵ</td>
	<td  width="22%">��Ӧ��������</td>
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