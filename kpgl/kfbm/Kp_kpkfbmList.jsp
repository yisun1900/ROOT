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
	String kp_kpkfbm_kpkfbm=null;
	String kp_kpkfbm_kpkfmc=null;
	String kp_kpkfbm_kfs=null;
	String kp_kpkfbm_pfxmbm=null;
	String kp_kpkfbm_kflx=null;
	kp_kpkfbm_kpkfbm=request.getParameter("kp_kpkfbm_kpkfbm");
	if (kp_kpkfbm_kpkfbm!=null)
	{
		kp_kpkfbm_kpkfbm=cf.GB2Uni(kp_kpkfbm_kpkfbm);
		if (!(kp_kpkfbm_kpkfbm.equals("")))	wheresql+=" and  (kp_kpkfbm.kpkfbm='"+kp_kpkfbm_kpkfbm+"')";
	}
	kp_kpkfbm_kpkfmc=request.getParameter("kp_kpkfbm_kpkfmc");
	if (kp_kpkfbm_kpkfmc!=null)
	{
		kp_kpkfbm_kpkfmc=cf.GB2Uni(kp_kpkfbm_kpkfmc);
		if (!(kp_kpkfbm_kpkfmc.equals("")))	wheresql+=" and  (kp_kpkfbm.kpkfmc='"+kp_kpkfbm_kpkfmc+"')";
	}
	kp_kpkfbm_kfs=request.getParameter("kp_kpkfbm_kfs");
	if (kp_kpkfbm_kfs!=null)
	{
		kp_kpkfbm_kfs=kp_kpkfbm_kfs.trim();
		if (!(kp_kpkfbm_kfs.equals("")))	wheresql+=" and (kp_kpkfbm.kfs="+kp_kpkfbm_kfs+") ";
	}
	kp_kpkfbm_pfxmbm=request.getParameter("kp_kpkfbm_pfxmbm");
	if (kp_kpkfbm_pfxmbm!=null)
	{
		kp_kpkfbm_pfxmbm=cf.GB2Uni(kp_kpkfbm_pfxmbm);
		if (!(kp_kpkfbm_pfxmbm.equals("")))	wheresql+=" and  (kp_kpkfbm.pfxmbm='"+kp_kpkfbm_pfxmbm+"')";
	}
	kp_kpkfbm_kflx=request.getParameter("kp_kpkfbm_kflx");
	if (kp_kpkfbm_kflx!=null)
	{
		kp_kpkfbm_kflx=cf.GB2Uni(kp_kpkfbm_kflx);
		if (!(kp_kpkfbm_kflx.equals("")))	wheresql+=" and  (kp_kpkfbm.kflx='"+kp_kpkfbm_kflx+"')";
	}
	ls_sql="SELECT kp_kpkfbm.kpkfbm,kp_kpkfbm.kpkfmc,kp_kpkfbm.kfs,kp_pfxmbm.pfxmmc, DECODE(kp_kpkfbm.kflx,'1','�۷�','2','ĳ�����Ϊ0')  ";
	ls_sql+=" FROM kp_kpkfbm,kp_pfxmbm  ";
    ls_sql+=" where kp_kpkfbm.pfxmbm=kp_pfxmbm.pfxmbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_kpkfbm.kpkfbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_kpkfbmList.jsp","SelectKp_kpkfbm.jsp","","EditKp_kpkfbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpkfbm","kp_kpkfbm_kpkfmc","kp_kpkfbm_kfs","kp_pfxmbm_pfxmmc","kp_kpkfbm_kflx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kpkfbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_kpkfbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] kpkfbm = request.getParameterValues("kpkfbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kpkfbm,"kpkfbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_kpkfbm where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="15%">�����۷ֱ���</td>
	<td  width="20%">�����۷�����</td>
	<td  width="15%">�۷���</td>
	<td  width="20%">��Ϊ0����Ŀ</td>
	<td  width="15%">�۷�����</td>
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