<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_mmccd.xh xh,mmdglxmc,mlxmc,DECODE(jc_mmccd.dsk,'1','����','2','˫��') dsk,jc_mmccd.mmxh,mmczmc,czmc,azwzmc,kqfxmc,TO_CHAR(jc_mmccd.tjx) tjx,jc_blbj.blxh, DECODE(jc_mmccd.ctbs,'3','����','4','�ı�') ctbs,dczlmc,TO_CHAR(jc_mmccd.dbh) dbh,jc_mmccd.mdk||'��'||jc_mmccd.mdg||'��'||jc_mmccd.qh md ,jc_mmccd.msk||'��'||jc_mmccd.msg ms,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,jc_mmccd.sl,TO_CHAR(jc_mmccd.dj) dj,sl*dj zj,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmccd.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmccd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb  ";
    ls_sql+=" where jc_mmccd.blxhbm=jc_blbj.blxhbm(+) and jc_mmccd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmccd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmccd.czbm=dm_czbm.czbm(+) and jc_mmccd.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmccd.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmccd.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmccd.mmxh=jc_mmxhb.mmxh(+) and jc_mmccd.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmccd.mlx=jdm_mlx.mlx(+) and jc_mmccd.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_blbj.dqbm(+)='"+dqbm+"' and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmccd.xh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmccdList.jsp?yddbh="+yddbh,"","","EditJc_mmccdMain.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"mmdglxmc","mlxmc","mmxh","dsk","mmczmc","czmc","azwzmc","kqfxmc","dczlmc","dbh","md","ms","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","dj","zj","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mmccdList.jsp?yddbh="+yddbh};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mmccd where "+chooseitem;
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
  <B><font size="3">ľ�ų��ⵥ�����ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(145);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">��������</td>
	<td  width="4%">������</td>
	<td  width="3%">ľ���ͺ�</td>
	<td  width="3%">��˫��</td>
	<td  width="7%">��ɫ</td>
	<td  width="3%">����</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�زĺ�</td>
	<td  width="7%">�Ŷ�����ߡ�ǽ��</td>
	<td  width="5%">���ȿ����</td>
	<td  width="3%">�߽���/ŷʽ��ñ</td>
	<td  width="7%">�����ͺ�</td>
	<td  width="4%">���ױ���</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="4%">�Ƿ��ж���</td>
	<td  width="3%">��������</td>
	<td  width="3%">����</td>
	<td  width="4%">�ܼ�</td>
	<td  width="6%">��Ƭ</td>
	<td  width="10%">��ע</td>
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