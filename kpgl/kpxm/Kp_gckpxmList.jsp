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
	String kp_gckpxm_kpxmbm=null;
	String kp_gckpxm_kpxmmc=null;
	String kp_gckpxm_kpdlbm=null;
	String kp_gckpxm_kpjg=null;
	String kp_gckpxm_kpjgdy=null;
	String kp_gckpxm_kpkfbm=null;
	String kp_gckpxm_kpcfbm=null;
	kp_gckpxm_kpxmbm=request.getParameter("kp_gckpxm_kpxmbm");
	if (kp_gckpxm_kpxmbm!=null)
	{
		kp_gckpxm_kpxmbm=cf.GB2Uni(kp_gckpxm_kpxmbm);
		if (!(kp_gckpxm_kpxmbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpxmbm='"+kp_gckpxm_kpxmbm+"')";
	}
	kp_gckpxm_kpxmmc=request.getParameter("kp_gckpxm_kpxmmc");
	if (kp_gckpxm_kpxmmc!=null)
	{
		kp_gckpxm_kpxmmc=cf.GB2Uni(kp_gckpxm_kpxmmc);
		if (!(kp_gckpxm_kpxmmc.equals("")))	wheresql+=" and  (kp_gckpxm.kpxmmc='"+kp_gckpxm_kpxmmc+"')";
	}
	kp_gckpxm_kpdlbm=request.getParameter("kp_gckpxm_kpdlbm");
	if (kp_gckpxm_kpdlbm!=null)
	{
		kp_gckpxm_kpdlbm=cf.GB2Uni(kp_gckpxm_kpdlbm);
		if (!(kp_gckpxm_kpdlbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpdlbm='"+kp_gckpxm_kpdlbm+"')";
	}
	kp_gckpxm_kpjg=request.getParameter("kp_gckpxm_kpjg");
	if (kp_gckpxm_kpjg!=null)
	{
		kp_gckpxm_kpjg=cf.GB2Uni(kp_gckpxm_kpjg);
		if (!(kp_gckpxm_kpjg.equals("")))	wheresql+=" and  (kp_gckpxm.kpjg='"+kp_gckpxm_kpjg+"')";
	}
	kp_gckpxm_kpjgdy=request.getParameter("kp_gckpxm_kpjgdy");
	if (kp_gckpxm_kpjgdy!=null)
	{
		kp_gckpxm_kpjgdy=cf.GB2Uni(kp_gckpxm_kpjgdy);
		if (!(kp_gckpxm_kpjgdy.equals("")))	wheresql+=" and  (kp_gckpxm.kpjgdy='"+kp_gckpxm_kpjgdy+"')";
	}
	kp_gckpxm_kpkfbm=request.getParameter("kp_gckpxm_kpkfbm");
	if (kp_gckpxm_kpkfbm!=null)
	{
		kp_gckpxm_kpkfbm=cf.GB2Uni(kp_gckpxm_kpkfbm);
		if (!(kp_gckpxm_kpkfbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpkfbm='"+kp_gckpxm_kpkfbm+"')";
	}
	kp_gckpxm_kpcfbm=request.getParameter("kp_gckpxm_kpcfbm");
	if (kp_gckpxm_kpcfbm!=null)
	{
		kp_gckpxm_kpcfbm=cf.GB2Uni(kp_gckpxm_kpcfbm);
		if (!(kp_gckpxm_kpcfbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpcfbm='"+kp_gckpxm_kpcfbm+"')";
	}
	ls_sql="SELECT kp_gckpxm.kpxmbm,kp_gckpxm.kpxmmc,kp_kpdlbm.kpdlmc,kp_gckpxm.kpjg,ydcdmc,kp_gckpxm.kpjgdy,kp_kpkfbm.kpkfmc,sgdfk,kp_kpcfbm.kpcfmc  ";
	ls_sql+=" FROM kp_gckpxm,kp_kpcfbm,kp_kpdlbm,kp_kpkfbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_gckpxm.kpcfbm=kp_kpcfbm.kpcfbm(+) and kp_gckpxm.kpkfbm=kp_kpkfbm.kpkfbm(+)";
    ls_sql+=" and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm(+) and kp_gckpxm.kpjg=kp_sgdyzcdbm.yzcdbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_gckpxm.kpxmbm,kp_gckpxm.kpjg";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_gckpxmList.jsp","SelectKp_gckpxm.jsp","","EditKp_gckpxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"kpxmbm","kpxmmc","ydcdmc","kpjgdy","kpkfmc","sgdfk","kpcfmc","kpdlmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"kpxmbm","kpjg"};
	pageObj.setKey(keyName);
	pageObj.alignStr[4]="align='left'";
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_gckpxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("kpxmbm","1");//�в����������Hash��
	spanColHash.put("kpxmmc","1");//�в����������Hash��
	spanColHash.put("kpdlmc","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_gckpxm where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="6%">������Ŀ����</td>
	<td  width="10%">������Ŀ����</td>
	<td  width="7%">���س̶�</td>
	<td  width="36%">���س̶ȶ���</td>
	<td  width="7%">�۷�</td>
	<td  width="7%">����</td>
	<td  width="10%">����</td>
	<td  width="10%">��������</td>
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