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

	String rwbm=null;
	String rwmc=null;
	String rwflbm=null;
	String rwdx=null;

	String sfsjysxm=null;
	String gcysxmbm=null;
	String sfsjzcxm=null;
	String zcdlbm=null;
	String sjzcjd=null;
	String bjjbbm=null;
	String bjsj=null;
	String sfyxhxgq=null;
	String zdjkrw=null;

	rwbm=request.getParameter("rwbm");
	if (rwbm!=null)
	{
		rwbm=cf.GB2Uni(rwbm);
		if (!(rwbm.equals("")))	wheresql+=" and  (gdm_rwbm.rwbm='"+rwbm+"')";
	}
	rwmc=request.getParameter("rwmc");
	if (rwmc!=null)
	{
		rwmc=cf.GB2Uni(rwmc);
		if (!(rwmc.equals("")))	wheresql+=" and  (gdm_rwbm.rwmc like '%"+rwmc+"%')";
	}
	rwflbm=request.getParameter("rwflbm");
	if (rwflbm!=null)
	{
		rwflbm=cf.GB2Uni(rwflbm);
		if (!(rwflbm.equals("")))	wheresql+=" and  (gdm_rwbm.rwflbm='"+rwflbm+"')";
	}
	rwdx=request.getParameter("rwdx");
	if (rwdx!=null)
	{
		rwdx=cf.GB2Uni(rwdx);
		if (!(rwdx.equals("")))	wheresql+=" and  (gdm_rwbm.rwdx='"+rwdx+"')";
	}


	sfsjysxm=request.getParameter("sfsjysxm");
	if (sfsjysxm!=null)
	{
		sfsjysxm=cf.GB2Uni(sfsjysxm);
		if (!(sfsjysxm.equals("")))	wheresql+=" and  (gdm_rwbm.sfsjysxm='"+sfsjysxm+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (gdm_rwbm.gcysxmbm='"+gcysxmbm+"')";
	}
	sfsjzcxm=request.getParameter("sfsjzcxm");
	if (sfsjzcxm!=null)
	{
		sfsjzcxm=sfsjzcxm.trim();
		if (!(sfsjzcxm.equals("")))	wheresql+=" and  (gdm_rwbm.sfsjzcxm='"+sfsjzcxm+"')";
	}
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (gdm_rwbm.zcdlbm='"+zcdlbm+"')";
	}


	sjzcjd=request.getParameter("sjzcjd");
	if (sjzcjd!=null)
	{
		sjzcjd=cf.GB2Uni(sjzcjd);
		if (!(sjzcjd.equals("")))	wheresql+=" and  (gdm_rwbm.sjzcjd='"+sjzcjd+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (gdm_rwbm.bjjbbm='"+bjjbbm+"')";
	}
	bjsj=request.getParameter("bjsj");
	if (bjsj!=null)
	{
		bjsj=cf.GB2Uni(bjsj);
		if (!(bjsj.equals("")))	wheresql+=" and  (gdm_rwbm.bjsj='"+bjsj+"')";
	}
	sfyxhxgq=request.getParameter("sfyxhxgq");
	if (sfyxhxgq!=null)
	{
		sfyxhxgq=cf.GB2Uni(sfyxhxgq);
		if (!(sfyxhxgq.equals("")))	wheresql+=" and  (gdm_rwbm.sfyxhxgq='"+sfyxhxgq+"')";
	}
	zdjkrw=request.getParameter("zdjkrw");
	if (zdjkrw!=null)
	{
		zdjkrw=cf.GB2Uni(zdjkrw);
		if (!(zdjkrw.equals("")))	wheresql+=" and  (gdm_rwbm.zdjkrw='"+zdjkrw+"')";
	}
	ls_sql="SELECT gdm_rwbm.rwbm,gdm_rwbm.rwmc,gdm_rwflbm.rwflmc, DECODE(sfsjysxm,'Y','��','N','��'),gcysxmmc, DECODE(sfsjzcxm,'Y','��','N','��'),zcdlbm,DECODE(sjzcjd,'03','����֪ͨ','05','�Ѳ���','25','����֪ͨ','26','����','09','��ͬ�����','11','��ͬ��ȷ��','13','�����ѽ���','15','ȷ���ͻ�ʱ��','17','��֪ͨ�ͻ�','19','�ͻ���װ���' ), DECODE(gdm_rwbm.sfyxhxgq,'Y','��','N','��'),DECODE(gdm_rwbm.zdjkrw,'Y','�ص�','N','���ص�'),DECODE(gdm_rwbm.bjsj,'1','��ǰ����','2','�º�����','3','��ǰ�º�����','9','������'),bjjbmc,gdm_rwbm.sqbjnr,gdm_rwbm.sqbjts,gdm_rwbm.shbjnr,gdm_rwbm.shbjts,hxrw,gdm_rwbm.rwxh,gdm_rwbm.bz  ";
	ls_sql+=" FROM gdm_rwflbm,gdm_rwbm,gdm_bjjbbm,dm_gcysxm  ";
    ls_sql+=" where gdm_rwbm.rwflbm=gdm_rwflbm.rwflbm(+) ";
    ls_sql+=" and gdm_rwbm.bjjbbm=gdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and gdm_rwbm.gcysxmbm=dm_gcysxm.gcysxmbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_rwbm.rwbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_rwbmList.jsp","","","EditGdm_rwbm.jsp");
	pageObj.setPageRow(20);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"rwbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Gdm_rwbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"rwbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewGdm_rwbm.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("rwbm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] rwbm = request.getParameterValues("rwbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rwbm,"rwbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from gdm_rwbm where "+chooseitem;
		sql[1]="delete from gdm_rwljgx where "+chooseitem;
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
	pageObj.printPageLink(270);
%>


<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="11%">��������</td>
	<td  width="3%">�������</td>
	<td  width="2%">�Ƿ��漰������Ŀ</td>
	<td  width="7%">������Ŀ</td>
	<td  width="2%">�Ƿ��漰������Ŀ</td>
	<td  width="5%">�漰���Ĵ���</td>
	<td  width="5%">�漰���Ľڵ�</td>
	<td  width="2%">�Ƿ�Ӱ���������</td>
	<td  width="2%">�ص�������</td>

	<td  width="3%">����ʱ��</td>
	<td  width="3%">��������</td>
	<td  width="12%">��ǰ��������</td>
	<td  width="2%">��ǰ��������</td>
	<td  width="12%">�º󱨾�����</td>
	<td  width="2%">�º󱨾�����</td>
	<td  width="10%">��������</td>
	<td  width="2%">�������</td>
	<td  width="10%">����ע</td>
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