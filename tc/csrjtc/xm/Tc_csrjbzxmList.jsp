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
	String tc_csrjbzxm_dqbm=null;
	String tc_csrjbzxm_bjjbbm=null;
	String tc_csrjbzxm_xmmc=null;
	String tc_csrjbzxm_ppmc=null;
	String tc_csrjbzxm_xh=null;
	String tc_csrjbzxm_jldw=null;
	String tc_csrjbzxm_bhsl=null;
	String tc_csrjbzxm_lrr=null;
	String tc_csrjbzxm_lrsj=null;
	tc_csrjbzxm_dqbm=request.getParameter("tc_csrjbzxm_dqbm");
	if (tc_csrjbzxm_dqbm!=null)
	{
		tc_csrjbzxm_dqbm=cf.GB2Uni(tc_csrjbzxm_dqbm);
		if (!(tc_csrjbzxm_dqbm.equals("")))	wheresql+=" and  (tc_csrjbzxm.dqbm='"+tc_csrjbzxm_dqbm+"')";
	}
	tc_csrjbzxm_bjjbbm=request.getParameter("tc_csrjbzxm_bjjbbm");
	if (tc_csrjbzxm_bjjbbm!=null)
	{
		tc_csrjbzxm_bjjbbm=cf.GB2Uni(tc_csrjbzxm_bjjbbm);
		if (!(tc_csrjbzxm_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjbzxm.bjjbbm='"+tc_csrjbzxm_bjjbbm+"')";
	}
	tc_csrjbzxm_xmmc=request.getParameter("tc_csrjbzxm_xmmc");
	if (tc_csrjbzxm_xmmc!=null)
	{
		tc_csrjbzxm_xmmc=cf.GB2Uni(tc_csrjbzxm_xmmc);
		if (!(tc_csrjbzxm_xmmc.equals("")))	wheresql+=" and  (tc_csrjbzxm.xmmc='"+tc_csrjbzxm_xmmc+"')";
	}
	tc_csrjbzxm_ppmc=request.getParameter("tc_csrjbzxm_ppmc");
	if (tc_csrjbzxm_ppmc!=null)
	{
		tc_csrjbzxm_ppmc=cf.GB2Uni(tc_csrjbzxm_ppmc);
		if (!(tc_csrjbzxm_ppmc.equals("")))	wheresql+=" and  (tc_csrjbzxm.ppmc='"+tc_csrjbzxm_ppmc+"')";
	}
	tc_csrjbzxm_xh=request.getParameter("tc_csrjbzxm_xh");
	if (tc_csrjbzxm_xh!=null)
	{
		tc_csrjbzxm_xh=cf.GB2Uni(tc_csrjbzxm_xh);
		if (!(tc_csrjbzxm_xh.equals("")))	wheresql+=" and  (tc_csrjbzxm.xh='"+tc_csrjbzxm_xh+"')";
	}
	tc_csrjbzxm_jldw=request.getParameter("tc_csrjbzxm_jldw");
	if (tc_csrjbzxm_jldw!=null)
	{
		tc_csrjbzxm_jldw=cf.GB2Uni(tc_csrjbzxm_jldw);
		if (!(tc_csrjbzxm_jldw.equals("")))	wheresql+=" and  (tc_csrjbzxm.jldw='"+tc_csrjbzxm_jldw+"')";
	}
	tc_csrjbzxm_bhsl=request.getParameter("tc_csrjbzxm_bhsl");
	if (tc_csrjbzxm_bhsl!=null)
	{
		tc_csrjbzxm_bhsl=tc_csrjbzxm_bhsl.trim();
		if (!(tc_csrjbzxm_bhsl.equals("")))	wheresql+=" and  (tc_csrjbzxm.bhsl="+tc_csrjbzxm_bhsl+") ";
	}
	tc_csrjbzxm_lrr=request.getParameter("tc_csrjbzxm_lrr");
	if (tc_csrjbzxm_lrr!=null)
	{
		tc_csrjbzxm_lrr=cf.GB2Uni(tc_csrjbzxm_lrr);
		if (!(tc_csrjbzxm_lrr.equals("")))	wheresql+=" and  (tc_csrjbzxm.lrr='"+tc_csrjbzxm_lrr+"')";
	}
	tc_csrjbzxm_lrsj=request.getParameter("tc_csrjbzxm_lrsj");
	if (tc_csrjbzxm_lrsj!=null)
	{
		tc_csrjbzxm_lrsj=tc_csrjbzxm_lrsj.trim();
		if (!(tc_csrjbzxm_lrsj.equals("")))	wheresql+="  and (tc_csrjbzxm.lrsj=TO_DATE('"+tc_csrjbzxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_csrjbzxm.dqbm,dm_dqbm.dqmc,tc_csrjbzxm.bjjbbm,tc_csrjbzxm.xmmc,tc_csrjbzxm.ppmc,tc_csrjbzxm.xh,tc_csrjbzxm.jldw,tc_csrjbzxm.bhsl,tc_csrjbzxm.bz,tc_csrjbzxm.lrr,tc_csrjbzxm.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_csrjbzxm  ";
    ls_sql+=" where tc_csrjbzxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjbzxm.dqbm,tc_csrjbzxm.xmmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_csrjbzxmList.jsp","","","EditTc_csrjbzxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_csrjbzxm_ppmc","tc_csrjbzxm_xh","tc_csrjbzxm_jldw","tc_csrjbzxm_bhsl","tc_csrjbzxm_bz","tc_csrjbzxm_lrr","tc_csrjbzxm_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm","bjjbbm","xmmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_csrjbzxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from tc_csrjbzxm where "+chooseitem;
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
  <B><font size="3">�ײͱ�׼��Ŀ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">����</td>
	<td  width="4%">����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="13%">��Ŀ����</td>
	<td  width="13%">Ʒ��</td>
	<td  width="13%">�ͺ�</td>
	<td  width="4%">������λ</td>
	<td  width="4%">��������</td>
	<td  width="28%">��ע������˵��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
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